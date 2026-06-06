import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:mime/mime.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'file_item.dart';

class FileService {
  /// Pick a file and copy it to app documents directory.
  /// Returns a FileItem on success, null if user cancelled.
  Future<FileItem?> pickAndSaveFile() async {
    // 1. Open the system file picker
    final result = await FilePicker.platform.pickFiles(
      type: FileType.any, // allow any file type
      withData: false, // no need to load bytes in memory
    );

    if (result == null) return null; // user cancelled

    final picked = result.files.single;
    if (picked.path == null) return null;

    // 2. Get app documents directory (persistent storage)
    final docsDir = await getApplicationDocumentsDirectory();
    final destPath = p.join(docsDir.path, 'uploads', picked.name);

    // 3. Create uploads folder if it doesn't exist
    final uploadsDir = Directory(p.join(docsDir.path, 'uploads'));
    if (!await uploadsDir.exists()) {
      await uploadsDir.create(recursive: true);
    }

    // 4. Copy file to app documents directory
    final sourceFile = File(picked.path!);
    final savedFile = await sourceFile.copy(destPath);

    // 5. Detect MIME type
    final mimeType = lookupMimeType(picked.name) ?? 'application/octet-stream';

    // 6. Build and return FileItem
    return FileItem(
      name: picked.name,
      path: savedFile.path,
      size: picked.size,
      mimeType: mimeType,
      uploadedAt: DateTime.now(),
      file: savedFile,
    );
  }

  /// Delete a saved file from storage
  Future<void> deleteFile(FileItem item) async {
    if (await item.file.exists()) {
      await item.file.delete();
    }
  }
}
