import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:mime/mime.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'file_item.dart';
import 'github_service.dart';

class FileService {
  final GitHubService _github = GitHubService();

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
      type    : FileType.any,
      withData: false,
    );

    if (result == null) return null; // user cancelled

    final picked = result.files.single;
    if (picked.path == null) return null;

    // 2. Get app documents directory (persistent local storage)
    final docsDir  = await getApplicationDocumentsDirectory();
    final destPath = p.join(docsDir.path, 'uploads', picked.name);

    // 3. Create local uploads folder if it does not exist
    final uploadsDir = Directory(p.join(docsDir.path, 'uploads'));
    if (!await uploadsDir.exists()) {
      await uploadsDir.create(recursive: true);
    }

    // 4. Copy file to app documents directory
    final sourceFile = File(picked.path!);
    final savedFile  = await sourceFile.copy(destPath);

    // 5. Detect MIME type
    final mimeType = lookupMimeType(picked.name) ?? 'application/octet-stream';

    // 6. Upload to GitHub repository
    try {
      onGitHubStatus?.call('⏳ Uploading ${picked.name} to GitHub...');

      final downloadUrl = await _github.uploadFile(
        file         : savedFile,
        fileName     : picked.name,
        commitMessage: 'Upload ${picked.name} via LabLens AI Flutter app',
      );

      onGitHubStatus?.call('✅ Uploaded to GitHub!\n$downloadUrl');
    } catch (e) {
      // GitHub upload failure is non-fatal — the file is still saved locally.
      onGitHubStatus?.call('⚠️ Saved locally, but GitHub upload failed:\n$e');
    }

    // 7. Build and return FileItem (local reference)
    return FileItem(
      name      : picked.name,
      path      : savedFile.path,
      size      : picked.size,
      mimeType  : mimeType,
      uploadedAt: DateTime.now(),
      file      : savedFile,
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
