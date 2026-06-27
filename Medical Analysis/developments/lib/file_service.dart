import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:medical_app/file_item.dart';
import 'package:medical_app/github_service.dart';

class FileService {
  final GitHubService _github = GitHubService();
  final ImagePicker _imagePicker = ImagePicker();

  /// Pick a file, copy it to app documents directory, and upload it to GitHub.
  /// Returns a [FileItem] on success, null if the user cancelled.
  ///
  /// The [onGitHubStatus] callback receives a status message string so the UI
  /// can display upload progress feedback to the user.
  Future<FileItem?> pickAndSaveFile({
    void Function(String status)? onGitHubStatus,
  }) async {
    // 1. Open the system file picker
    final result = await FilePicker.platform.pickFiles(
      type: FileType.any,
      withData: false,
    );

    if (result == null) return null; // user cancelled

    final picked = result.files.single;
    if (picked.path == null) return null;

    return _saveAndUpload(
      sourcePath: picked.path!,
      fileName: picked.name,
      fileSize: picked.size,
      onGitHubStatus: onGitHubStatus,
    );
  }

  /// Capture a photo using the device camera, save it locally, and upload
  /// it to GitHub.
  /// Returns a [FileItem] on success, null if the user cancelled.
  ///
  /// The [onGitHubStatus] callback receives a status message string so the UI
  /// can display upload progress feedback to the user.
  Future<FileItem?> pickFromCamera({
    void Function(String status)? onGitHubStatus,
  }) async {
    // Open the device camera
    final XFile? photo = await _imagePicker.pickImage(
      source: ImageSource.camera,
      imageQuality: 90, // slight compression to keep file size reasonable
    );

    if (photo == null) return null; // user cancelled

    final sourceFile = File(photo.path);
    final fileSize = await sourceFile.length();

    // Generate a timestamped filename so photos don't overwrite each other
    final timestamp = DateTime.now()
        .toIso8601String()
        .replaceAll(':', '-')
        .replaceAll('.', '-');
    final fileName = 'photo_$timestamp.jpg';

    return _saveAndUpload(
      sourcePath: photo.path,
      fileName: fileName,
      fileSize: fileSize,
      onGitHubStatus: onGitHubStatus,
    );
  }

  // ── Shared save + upload logic ─────────────────────────────────────────────

  /// Copies the file at [sourcePath] into the local uploads directory,
  /// detects its MIME type, uploads it to GitHub, and returns a [FileItem].
  Future<FileItem?> _saveAndUpload({
    required String sourcePath,
    required String fileName,
    required int fileSize,
    void Function(String status)? onGitHubStatus,
  }) async {
    // Get app documents directory (persistent local storage)
    final docsDir = await getApplicationDocumentsDirectory();
    final destPath = p.join(docsDir.path, 'uploads', fileName);

    // Create local uploads folder if it does not exist
    final uploadsDir = Directory(p.join(docsDir.path, 'uploads'));
    if (!await uploadsDir.exists()) {
      await uploadsDir.create(recursive: true);
    }

    // Copy file to app documents directory
    final sourceFile = File(sourcePath);
    final savedFile = await sourceFile.copy(destPath);

    // Detect MIME type
    final mimeType = lookupMimeType(fileName) ?? 'application/octet-stream';

    // Upload to GitHub repository
    try {
      onGitHubStatus?.call('⏳ Uploading $fileName to GitHub...');

      final downloadUrl = await _github.uploadFile(
        file: savedFile,
        fileName: fileName,
        commitMessage: 'Upload $fileName via LabLens AI Flutter app',
      );

      onGitHubStatus?.call('✅ Uploaded to GitHub!\n$downloadUrl');
    } catch (e) {
      // GitHub upload failure is non-fatal — the file is still saved locally.
      onGitHubStatus?.call('⚠️ Saved locally, but GitHub upload failed:\n$e');
    }

    // Build and return FileItem (local reference)
    return FileItem(
      name: fileName,
      path: savedFile.path,
      size: fileSize,
      mimeType: mimeType,
      uploadedAt: DateTime.now(),
      file: savedFile,
    );
  }

  /// Delete a saved file from local storage.
  Future<void> deleteFile(FileItem item) async {
    if (await item.file.exists()) {
      await item.file.delete();
    }
  }

  /// Check GitHub repository connection and return a status message.
  Future<String> checkGitHubConnection() {
    return _github.checkConnection();
  }

  /// List files currently stored in the GitHub repository folder.
  Future<List<Map<String, dynamic>>> listGitHubFiles() {
    return _github.listFiles();
  }

  /// Delete a file from the GitHub repository.
  Future<void> deleteGitHubFile(String repoPath, String sha) {
    return _github.deleteFile(repoPath, sha);
  }
}
