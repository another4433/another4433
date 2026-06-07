import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

/// Service for uploading files to a GitHub repository via the GitHub REST API.
///
/// Target repository : https://github.com/moad-cod/AI-Innovators---USAII-Hackathon
/// Branch            : ui/setup
/// Folder            : files/
///
/// IMPORTANT: Replace [_token] value with your GitHub Personal Access Token.
/// GitHub no longer accepts passwords for API calls (deprecated 2021).
/// Generate a PAT at: GitHub → Settings → Developer Settings →
///   Personal Access Tokens → Tokens (classic) → with "repo" scope.
class GitHubService {
  // ─── Configuration ────────────────────────────────────────────────────────

  /// Replace this with your GitHub Personal Access Token (starts with ghp_).
  /// DO NOT commit a real token to source control.
  static const String _token =
      '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';

  static const String _owner = 'moad-cod';
  static const String _repo = 'AI-Innovators---USAII-Hackathon';
  static const String _branch = 'ui/setup';
  static const String _folder = 'files';

  static const String _baseUrl = 'https://api.github.com';

  // ─── Headers ──────────────────────────────────────────────────────────────

  Map<String, String> get _headers => {
    'Authorization': 'Bearer $_token',
    'Accept': 'application/vnd.github+json',
    'Content-Type': 'application/json',
    'X-GitHub-Api-Version': '2022-11-28',
  };

  // ─── Public API ───────────────────────────────────────────────────────────

  /// Uploads [file] with [fileName] into the [_folder] folder on [_branch].
  ///
  /// If the [_folder] does not exist yet in the repository, this method first
  /// creates a placeholder `.gitkeep` file inside it so that GitHub creates
  /// the folder automatically, then proceeds to upload the actual file.
  ///
  /// Returns the raw download URL of the uploaded file on success.
  Future<String> uploadFile({
    required File file,
    required String fileName,
    String? commitMessage,
  }) async {
    // Ensure the target folder exists in the repo; create it if not.
    await _ensureFolderExists();

    // Build the in-repo path for this file.
    final repoPath = '$_folder/$fileName';

    // Read bytes and encode to Base64 (required by GitHub API).
    final bytes = await file.readAsBytes();
    final base64Content = base64Encode(bytes);

    // Check whether the file already exists (update requires its current SHA).
    final existingSha = await _getFileSha(repoPath);

    final body = {
      'message': commitMessage ?? 'Upload $fileName via Flutter app',
      'content': base64Content,
      'branch': _branch,
      if (existingSha != null) 'sha': existingSha,
    };

    final url = '$_baseUrl/repos/$_owner/$_repo/contents/$repoPath';
    final response = await http.put(
      Uri.parse(url),
      headers: _headers,
      body: jsonEncode(body),
    );

    if (response.statusCode != 200 && response.statusCode != 201) {
      final error = jsonDecode(response.body);
      throw Exception('GitHub upload failed: ${error['message']}');
    }

    final data = jsonDecode(response.body);
    return data['content']['download_url'] as String;
  }

  /// Deletes a file at [repoPath] (e.g. "files/report.pdf") with its [sha].
  Future<void> deleteFile(String repoPath, String sha) async {
    final url = '$_baseUrl/repos/$_owner/$_repo/contents/$repoPath';
    final response = await http.delete(
      Uri.parse(url),
      headers: _headers,
      body: jsonEncode({
        'message': 'Delete $repoPath via Flutter app',
        'sha': sha,
        'branch': _branch,
      }),
    );

    if (response.statusCode != 200) {
      throw Exception('GitHub delete failed: ${response.statusCode}');
    }
  }

  /// Lists all files inside the [_folder] directory on [_branch].
  /// Returns an empty list if the folder does not exist yet.
  Future<List<Map<String, dynamic>>> listFiles() async {
    final url =
        '$_baseUrl/repos/$_owner/$_repo/contents/$_folder'
        '?ref=$_branch';

    final response = await http.get(Uri.parse(url), headers: _headers);

    if (response.statusCode == 404) return []; // folder not created yet
    if (response.statusCode != 200) {
      throw Exception('Failed to list files: ${response.statusCode}');
    }

    final List data = jsonDecode(response.body);
    return data
        .where((item) => item['type'] == 'file' && item['name'] != '.gitkeep')
        .map(
          (item) => {
            'name': item['name'] as String,
            'size': item['size'] as int,
            'sha': item['sha'] as String,
            'download_url': item['download_url'] as String,
            'html_url': item['html_url'] as String,
            'path': item['path'] as String,
          },
        )
        .toList()
        .cast<Map<String, dynamic>>();
  }

  /// Verifies that the token and repository are accessible.
  /// Returns a status message string.
  Future<String> checkConnection() async {
    final url = '$_baseUrl/repos/$_owner/$_repo';
    final response = await http.get(Uri.parse(url), headers: _headers);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return '✅ Connected to "${data['full_name']}" '
          '(branch: $_branch, folder: $_folder/)';
    } else if (response.statusCode == 401) {
      return '❌ Authentication failed. Check your Personal Access Token.';
    } else if (response.statusCode == 404) {
      return '❌ Repository not found. Check owner/repo name.';
    } else {
      return '❌ Error ${response.statusCode}: '
          '${jsonDecode(response.body)['message']}';
    }
  }

  // ─── Private helpers ──────────────────────────────────────────────────────

  /// Returns the current SHA of [repoPath] if it already exists,
  /// or null if the file is new.
  Future<String?> _getFileSha(String repoPath) async {
    final url =
        '$_baseUrl/repos/$_owner/$_repo/contents/$repoPath'
        '?ref=$_branch';
    final response = await http.get(Uri.parse(url), headers: _headers);

    if (response.statusCode == 200) {
      return jsonDecode(response.body)['sha'] as String?;
    }
    return null;
  }

  /// Ensures the [_folder] exists in the repository.
  ///
  /// GitHub does not support empty folders. The first time this runs it
  /// commits a hidden `.gitkeep` placeholder, which causes GitHub to create
  /// the folder. On subsequent calls the folder already exists, so nothing
  /// happens.
  Future<void> _ensureFolderExists() async {
    final keepPath = '$_folder/.gitkeep';
    final existing = await _getFileSha(keepPath);

    // Folder already has the placeholder — nothing to do.
    if (existing != null) return;

    // Check if folder exists at all via listFiles.
    final url =
        '$_baseUrl/repos/$_owner/$_repo/contents/$_folder'
        '?ref=$_branch';
    final response = await http.get(Uri.parse(url), headers: _headers);
    if (response.statusCode == 200) return; // folder already exists

    // Folder does not exist — create it by committing a .gitkeep file.
    final body = {
      'message': 'Create $_folder/ folder via Flutter app',
      'content': base64Encode(utf8.encode('')), // empty file, Base64 encoded
      'branch': _branch,
    };

    final putUrl = '$_baseUrl/repos/$_owner/$_repo/contents/$keepPath';
    final putResponse = await http.put(
      Uri.parse(putUrl),
      headers: _headers,
      body: jsonEncode(body),
    );

    if (putResponse.statusCode != 200 && putResponse.statusCode != 201) {
      final error = jsonDecode(putResponse.body);
      throw Exception('Failed to create folder: ${error['message']}');
    }
  }
}
