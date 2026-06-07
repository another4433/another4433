// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:open_filex/open_filex.dart';
import 'file_item.dart';
import 'file_service.dart';

// ════════════════════════════════════════════════════════════════════════════
// INSTRUCTIONS: In your home.dart file, replace the entire FileListPage class
// (lines 972–1136) with the code below. All other code in home.dart remains
// unchanged. Also add this import at the top of home.dart if not present:
//   import 'package:http/http.dart' as http;
// ════════════════════════════════════════════════════════════════════════════

class FileListPageReplaced extends StatefulWidget {
  const FileListPageReplaced({super.key});
  @override
  State<FileListPageReplaced> createState() => _FileListPageState();
}

class _FileListPageState extends State<FileListPageReplaced> {
  // Local list of files picked in this session
  final List<FileItem> _files = [];

  final _service = FileService();
  bool _isLoading = false;
  bool _isCheckingGitHub = false;
  String? _githubStatus;

  // ── GitHub connection check ───────────────────────────────────────────────

  Future<void> _checkGitHubConnection() async {
    setState(() {
      _isCheckingGitHub = true;
      _githubStatus = null;
    });
    try {
      final status = await _service.checkGitHubConnection();
      setState(() => _githubStatus = status);
    } catch (e) {
      setState(() => _githubStatus = '❌ Connection error: $e');
    } finally {
      setState(() => _isCheckingGitHub = false);
    }
  }

  // ── Pick & upload file ────────────────────────────────────────────────────

  Future<void> _pickFile() async {
    setState(() => _isLoading = true);

    try {
      final fileItem = await _service.pickAndSaveFile(
        onGitHubStatus: (status) {
          // Show GitHub upload status in a snackbar as it progresses
          _showSnackbar(status);
        },
      );

      if (fileItem != null) {
        setState(() => _files.add(fileItem));
        _showSnackbar('✅ ${fileItem.name} saved locally & queued to GitHub!');
      }
    } catch (e) {
      _showSnackbar('❌ Error: $e');
    } finally {
      setState(() => _isLoading = false);
    }
  }

  // ── Delete local file ─────────────────────────────────────────────────────

  Future<void> _deleteFile(int index) async {
    final item = _files[index];
    await _service.deleteFile(item);
    setState(() => _files.removeAt(index));
    _showSnackbar('🗑️ ${item.name} deleted locally');
  }

  void _showSnackbar(String msg) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(msg), duration: const Duration(seconds: 4)),
    );
  }

  // ── Build ─────────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('File Management'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        actions: [
          // GitHub connection check button
          IconButton(
            icon:
                _isCheckingGitHub
                    ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 2,
                      ),
                    )
                    : const Icon(Icons.cloud_outlined),
            tooltip: 'Check GitHub connection',
            onPressed: _isCheckingGitHub ? null : _checkGitHubConnection,
          ),
          // Clear all local files
          if (_files.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.delete_sweep),
              tooltip: 'Clear all local files',
              onPressed: () async {
                for (final f in _files) {
                  await _service.deleteFile(f);
                }
                setState(() => _files.clear());
              },
            ),
        ],
      ),

      body: Column(
        children: [
          // ── GitHub status banner ─────────────────────────────────────────
          if (_githubStatus != null)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              color:
                  _githubStatus!.startsWith('✅')
                      ? Colors.green.shade50
                      : Colors.red.shade50,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    _githubStatus!.startsWith('✅')
                        ? Icons.check_circle_outline
                        : Icons.error_outline,
                    color:
                        _githubStatus!.startsWith('✅')
                            ? Colors.green
                            : Colors.red,
                    size: 20,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      _githubStatus!,
                      style: TextStyle(
                        fontSize: 13,
                        color:
                            _githubStatus!.startsWith('✅')
                                ? Colors.green.shade800
                                : Colors.red.shade800,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => setState(() => _githubStatus = null),
                    child: const Icon(
                      Icons.close,
                      size: 18,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),

          // ── GitHub repo info card ────────────────────────────────────────
          Container(
            margin: const EdgeInsets.all(12),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.indigo.shade50,
              border: Border.all(color: Colors.indigo.shade200),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.cloud_upload_outlined,
                  color: Colors.indigo,
                  size: 28,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'GitHub Repository',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.indigo,
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        'moad-cod / AI-Innovators---USAII-Hackathon',
                        style: TextStyle(fontSize: 12, color: Colors.black54),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        'Branch: ui/setup  •  Folder: files/',
                        style: TextStyle(fontSize: 11, color: Colors.black45),
                      ),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: _isCheckingGitHub ? null : _checkGitHubConnection,
                  child: const Text('Test', style: TextStyle(fontSize: 12)),
                ),
              ],
            ),
          ),

          // ── Local file list ──────────────────────────────────────────────
          Expanded(
            child:
                _files.isEmpty
                    ? _buildEmptyState()
                    : ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemCount: _files.length,
                      itemBuilder: (ctx, i) => _buildFileCard(_files[i], i),
                    ),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: _isLoading ? null : _pickFile,
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        icon:
            _isLoading
                ? const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 2,
                  ),
                )
                : const Icon(Icons.upload_file),
        label: Text(_isLoading ? 'Uploading...' : 'Upload File'),
      ),
    );
  }

  // ── Empty state ───────────────────────────────────────────────────────────

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.folder_open, size: 80, color: Colors.grey.shade300),
          const SizedBox(height: 16),
          const Text(
            'No files yet',
            style: TextStyle(fontSize: 18, color: Colors.grey),
          ),
          const SizedBox(height: 8),
          const Text(
            'Tap Upload File to pick a file.\nIt will be saved locally and\nuploaded to the GitHub repository.',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey, fontSize: 13),
          ),
        ],
      ),
    );
  }

  // ── File card ─────────────────────────────────────────────────────────────

  Widget _buildFileCard(FileItem item, int index) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),

        // File type icon
        leading: CircleAvatar(
          backgroundColor: Colors.indigo.withOpacity(0.1).withValues(),
          child: Text(item.icon, style: const TextStyle(fontSize: 22)),
        ),

        // File name & details
        title: Text(
          item.name,
          style: const TextStyle(fontWeight: FontWeight.w500),
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(item.mimeType, style: const TextStyle(fontSize: 12)),
            Text(
              '${item.formattedSize} • ${item.uploadedAt.toLocal()}',
              style: const TextStyle(fontSize: 11, color: Colors.grey),
            ),
            // GitHub sync badge
            Row(
              children: [
                Icon(
                  Icons.cloud_done_outlined,
                  size: 12,
                  color: Colors.indigo.shade300,
                ),
                const SizedBox(width: 4),
                Text(
                  'Synced to GitHub › files/${item.name}',
                  style: TextStyle(fontSize: 11, color: Colors.indigo.shade400),
                ),
              ],
            ),
          ],
        ),

        // Open & Delete actions
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.open_in_new, color: Colors.indigo),
              tooltip: 'Open locally',
              onPressed: () => OpenFilex.open(item.path),
            ),
            IconButton(
              icon: const Icon(Icons.delete_outline, color: Colors.red),
              tooltip: 'Delete locally',
              onPressed: () => _deleteFile(index),
            ),
          ],
        ),
      ),
    );
  }
}
