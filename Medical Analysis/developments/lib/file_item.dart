import 'dart:io';

class FileItem {
  final String name;
  final String path;
  final int size;
  final String mimeType;
  final DateTime uploadedAt;
  final File file; // dart:io File object

  FileItem({
    required this.name,
    required this.path,
    required this.size,
    required this.mimeType,
    required this.uploadedAt,
    required this.file,
  });

  // Human-readable file size
  String get formattedSize {
    if (size < 1024) return '$size B';
    if (size < 1024 * 1024) return '${(size / 1024).toStringAsFixed(1)} KB';
    return '${(size / (1024 * 1024)).toStringAsFixed(1)} MB';
  }

  // Icon based on MIME type
  String get icon {
    if (mimeType.startsWith('image/')) return '🖼️';
    if (mimeType.startsWith('video/')) return '🎬';
    if (mimeType.startsWith('audio/')) return '🎵';
    if (mimeType == 'application/pdf') return '📄';
    if (mimeType.contains('spreadsheet') || mimeType.contains('excel')) {
      return '📊';
    }
    if (mimeType.contains('word') || mimeType.contains('document')) return '📝';
    if (mimeType.contains('zip') || mimeType.contains('compressed')) {
      return '🗜️';
    }
    return '📁';
  }
}
