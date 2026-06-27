import 'dart:convert';
//import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
//import 'package:mime/mime.dart';
import 'package:medical_app/file_item.dart';

/// AI-powered explanation page for an uploaded file.
///
/// Accepts a [FileItem] and sends its content to the Anthropic Claude API
/// to generate a human-readable explanation.
///
/// Supported content types:
///   • Plain text / source code / JSON / CSV  → sent as text
///   • Images (jpg, png, gif, webp)           → sent as base64 image
///   • PDF / binary / other                   → metadata-only explanation
///
/// ─── Setup ────────────────────────────────────────────────────────────────
/// Replace [_claudeApiKey] with your Anthropic API key.
/// Get one at: https://console.anthropic.com → API Keys
/// ──────────────────────────────────────────────────────────────────────────
class FileUploadExplainatory extends StatefulWidget {
  final FileItem fileItem;

  const FileUploadExplainatory(this.fileItem, {super.key});

  @override
  State<FileUploadExplainatory> createState() => _FileUploadExplanatoryState();
}

class _FileUploadExplanatoryState extends State<FileUploadExplainatory> {
  // ─── Configuration ────────────────────────────────────────────────────────

  /// Replace with your Anthropic API key (starts with sk-ant-).
  static const String _claudeApiKey =
      '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';

  static const String _claudeModel = 'claude-sonnet-4-6';
  static const String _claudeBaseUrl = 'https://api.anthropic.com/v1/messages';

  // ─── State ────────────────────────────────────────────────────────────────

  bool _isLoading = true;
  String? _explanation;
  String? _errorMessage;

  // Detected content category — drives which Claude payload is built
  late _ContentType _contentType;

  // ─── Lifecycle ────────────────────────────────────────────────────────────

  @override
  void initState() {
    super.initState();
    _contentType = _resolveContentType(widget.fileItem.mimeType);
    _generateExplanation();
  }

  // ─── Content type resolution ──────────────────────────────────────────────

  _ContentType _resolveContentType(String mimeType) {
    if (mimeType.startsWith('image/jpeg') ||
        mimeType.startsWith('image/png') ||
        mimeType.startsWith('image/gif') ||
        mimeType.startsWith('image/webp')) {
      return _ContentType.image;
    }
    if (mimeType.startsWith('text/') ||
        mimeType == 'application/json' ||
        mimeType == 'application/xml' ||
        mimeType == 'application/javascript' ||
        mimeType == 'application/typescript' ||
        mimeType.contains('csv')) {
      return _ContentType.text;
    }
    // PDF, docx, zip, binary — explain from metadata only
    return _ContentType.metadataOnly;
  }

  // ─── Claude API call ──────────────────────────────────────────────────────

  Future<void> _generateExplanation() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
      _explanation = null;
    });

    try {
      final String result;

      switch (_contentType) {
        case _ContentType.text:
          result = await _explainTextFile();
          break;
        case _ContentType.image:
          result = await _explainImageFile();
          break;
        case _ContentType.metadataOnly:
          result = await _explainFromMetadata();
          break;
      }

      setState(() {
        _explanation = result;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _errorMessage = 'Failed to generate explanation:\n$e';
        _isLoading = false;
      });
    }
  }

  /// Reads file as UTF-8 text and sends it to Claude for explanation.
  Future<String> _explainTextFile() async {
    final raw = await widget.fileItem.file.readAsString();

    // Truncate to ~8 000 characters to stay within token budget
    final truncated =
        raw.length > 8000
            ? '${raw.substring(0, 8000)}\n\n[... content truncated ...]'
            : raw;

    final payload = {
      'model': _claudeModel,
      'max_tokens': 1024,
      'system': _systemPrompt,
      'messages': [
        {
          'role': 'user',
          'content': [
            {
              'type': 'text',
              'text':
                  'Here is the content of the file named '
                  '"${widget.fileItem.name}" '
                  '(${widget.fileItem.mimeType}):\n\n'
                  '```\n$truncated\n```\n\n'
                  'Please explain what this file is, what it contains, '
                  'and what it is used for.',
            },
          ],
        },
      ],
    };

    return _callClaudeApi(payload);
  }

  /// Encodes the image file as base64 and sends it to Claude vision.
  Future<String> _explainImageFile() async {
    final bytes = await widget.fileItem.file.readAsBytes();
    final base64Image = base64Encode(bytes);
    final mediaType = widget.fileItem.mimeType;

    final payload = {
      'model': _claudeModel,
      'max_tokens': 1024,
      'system': _systemPrompt,
      'messages': [
        {
          'role': 'user',
          'content': [
            {
              'type': 'image',
              'source': {
                'type': 'base64',
                'media_type': mediaType,
                'data': base64Image,
              },
            },
            {
              'type': 'text',
              'text':
                  'This image was uploaded as "${widget.fileItem.name}". '
                  'Please describe what you see in this image in detail, '
                  'and explain what it might represent or be used for in '
                  'a medical or research context if applicable.',
            },
          ],
        },
      ],
    };

    return _callClaudeApi(payload);
  }

  /// Builds an explanation purely from file metadata (no file reading).
  Future<String> _explainFromMetadata() async {
    final payload = {
      'model': _claudeModel,
      'max_tokens': 1024,
      'system': _systemPrompt,
      'messages': [
        {
          'role': 'user',
          'content': [
            {
              'type': 'text',
              'text':
                  'A file has been uploaded with the following metadata:\n\n'
                  '• File name : ${widget.fileItem.name}\n'
                  '• MIME type : ${widget.fileItem.mimeType}\n'
                  '• File size : ${widget.fileItem.formattedSize}\n'
                  '• Uploaded  : ${widget.fileItem.uploadedAt.toLocal()}\n\n'
                  'Based on this metadata, explain what type of file this '
                  'likely is, what it is commonly used for, and any relevant '
                  'details a user should know about this file format.',
            },
          ],
        },
      ],
    };

    return _callClaudeApi(payload);
  }

  /// Sends the constructed [payload] to the Claude API and returns the text.
  Future<String> _callClaudeApi(Map<String, dynamic> payload) async {
    final response = await http.post(
      Uri.parse(_claudeBaseUrl),
      headers: {
        'x-api-key': _claudeApiKey,
        'anthropic-version': '2023-06-01',
        'content-type': 'application/json',
      },
      body: jsonEncode(payload),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      // Extract text from the first content block
      final content = data['content'] as List;
      return content
          .where((block) => block['type'] == 'text')
          .map((block) => block['text'] as String)
          .join('\n');
    } else if (response.statusCode == 401) {
      throw Exception(
        'Invalid API key. Replace YOUR_ANTHROPIC_API_KEY in '
        'file_upload_explainatory.dart.',
      );
    } else {
      final error = jsonDecode(response.body);
      throw Exception(
        'Claude API error ${response.statusCode}: '
        '${error['error']?['message'] ?? response.body}',
      );
    }
  }

  // ─── System prompt ────────────────────────────────────────────────────────

  static const String _systemPrompt =
      'You are an intelligent file analysis assistant embedded in a medical '
      'application called LabLens AI. Your role is to examine uploaded files '
      'and provide clear, structured, and helpful explanations about them. '
      'Be concise but thorough. Use plain language suitable for medical '
      'professionals and researchers. If the file appears to be medical data, '
      'highlight clinically relevant details. Format your response with '
      'clear sections using short headings where appropriate.';

  // ─── Build ────────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: const Text('AI File Explanation'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        actions: [
          // Retry button
          if (!_isLoading)
            IconButton(
              icon: const Icon(Icons.refresh),
              tooltip: 'Regenerate explanation',
              onPressed: _generateExplanation,
            ),
        ],
      ),
      body: Column(
        children: [
          // ── File metadata header ─────────────────────────────────────────
          _buildFileHeader(),

          // ── Explanation body ─────────────────────────────────────────────
          Expanded(
            child:
                _isLoading
                    ? _buildLoadingState()
                    : _errorMessage != null
                    ? _buildErrorState()
                    : _buildExplanationContent(),
          ),
        ],
      ),
    );
  }

  // ─── File header card ─────────────────────────────────────────────────────

  Widget _buildFileHeader() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.indigo.shade100),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.indigo.withOpacity(0.06).withValues(),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // File type emoji icon
          CircleAvatar(
            radius: 28,
            backgroundColor: Colors.indigo.shade50,
            child: Text(
              widget.fileItem.icon,
              style: const TextStyle(fontSize: 26),
            ),
          ),
          const SizedBox(width: 14),

          // File metadata
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.fileItem.name,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  widget.fileItem.mimeType,
                  style: const TextStyle(fontSize: 12, color: Colors.black45),
                ),
                const SizedBox(height: 2),
                Text(
                  '${widget.fileItem.formattedSize}  •  '
                  'Uploaded ${_formatDate(widget.fileItem.uploadedAt)}',
                  style: const TextStyle(fontSize: 11, color: Colors.black38),
                ),
              ],
            ),
          ),

          // Content type badge
          _ContentTypeBadge(_contentType),
        ],
      ),
    );
  }

  // ─── Loading state ────────────────────────────────────────────────────────

  Widget _buildLoadingState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(color: Colors.indigo),
            const SizedBox(height: 24),
            Text(
              'Analysing "${widget.fileItem.name}"...',
              style: const TextStyle(fontSize: 15, color: Colors.black54),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            const Text(
              'Claude AI is reading and explaining your file.',
              style: TextStyle(fontSize: 12, color: Colors.black38),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  // ─── Error state ──────────────────────────────────────────────────────────

  Widget _buildErrorState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, color: Colors.red, size: 56),
            const SizedBox(height: 16),
            const Text(
              'Could not generate explanation',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.red.shade50,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.red.shade200),
              ),
              child: Text(
                _errorMessage!,
                style: TextStyle(fontSize: 12, color: Colors.red.shade800),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: _generateExplanation,
              icon: const Icon(Icons.refresh),
              label: const Text('Try Again'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigo,
                foregroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ─── Explanation content ──────────────────────────────────────────────────

  Widget _buildExplanationContent() {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(12, 0, 12, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // AI label row
          Row(
            children: [
              const Icon(Icons.auto_awesome, color: Colors.indigo, size: 16),
              const SizedBox(width: 6),
              Text(
                'Generated by Claude AI',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.indigo.shade400,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),

          // Explanation card
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.shade200),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.04).withValues(),
                  blurRadius: 6,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: SelectableText(
              _explanation!,
              style: const TextStyle(
                fontSize: 14,
                height: 1.65,
                color: Colors.black87,
              ),
            ),
          ),

          const SizedBox(height: 16),

          // Disclaimer
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(Icons.info_outline, size: 14, color: Colors.black38),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  'AI-generated content. Always verify critical information '
                  'with qualified professionals.',
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.grey.shade500,
                    height: 1.4,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ─── Helpers ──────────────────────────────────────────────────────────────

  String _formatDate(DateTime dt) {
    final local = dt.toLocal();
    return '${local.day}/${local.month}/${local.year} '
        '${local.hour.toString().padLeft(2, '0')}:'
        '${local.minute.toString().padLeft(2, '0')}';
  }
}

// ─── Content type enum ────────────────────────────────────────────────────────

enum _ContentType { text, image, metadataOnly }

// ─── Content type badge widget ────────────────────────────────────────────────

class _ContentTypeBadge extends StatelessWidget {
  final _ContentType type;
  const _ContentTypeBadge(this.type);

  @override
  Widget build(BuildContext context) {
    final (label, color, icon) = switch (type) {
      _ContentType.text => ('Text', Colors.blue, Icons.text_snippet_outlined),
      _ContentType.image => ('Image', Colors.teal, Icons.image_outlined),
      _ContentType.metadataOnly => (
        'Metadata',
        Colors.orange,
        Icons.info_outlined,
      ),
    };

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1).withValues(),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withOpacity(0.3).withValues()),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 12, color: color),
          const SizedBox(width: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 11,
              color: color,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
