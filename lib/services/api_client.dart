import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:myportofolio_mobile/config.dart';
import 'package:myportofolio_mobile/models/experience.dart';

class ApiException implements Exception {
  const ApiException(this.message, {this.statusCode});

  final String message;
  final int? statusCode;

  @override
  String toString() =>
      statusCode != null ? 'ApiException ($statusCode): $message' : message;
}

class ApiClient {
  ApiClient({http.Client? client, this.baseUrl = apiBaseUrl})
    : _client = client ?? http.Client();

  final http.Client _client;
  final String baseUrl;

  Uri _uri(String path) => Uri.parse('$baseUrl$path');

  Map<String, String> _headers({String? token}) => {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    if (token != null && token.isNotEmpty) 'Authorization': 'Token $token',
  };

  /// Mengambil daftar pengalaman (publik, tanpa token).
  Future<List<Experience>> fetchExperiences() async {
    final response = await _client.get(
      _uri('/api/v1/experiences/'),
      headers: _headers(),
    );

    if (response.statusCode != 200) {
      throw ApiException(
        'Gagal memuat daftar pengalaman (${response.statusCode})',
        statusCode: response.statusCode,
      );
    }

    final decoded = jsonDecode(response.body);
    final List<dynamic> items = decoded is List
        ? decoded
        : (decoded as Map<String, dynamic>)['results'] as List<dynamic>;

    return items
        .map((e) => Experience.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  /// Login untuk mendapatkan token DRF.
  Future<String> login({
    required String username,
    required String password,
  }) async {
    final response = await _client.post(
      _uri('/api/v1/auth/token/'),
      headers: _headers(),
      body: jsonEncode({'username': username, 'password': password}),
    );

    if (response.statusCode != 200) {
      throw ApiException(
        'Login gagal. Periksa username atau password.',
        statusCode: response.statusCode,
      );
    }

    final data = jsonDecode(response.body) as Map<String, dynamic>;
    return data['token'] as String;
  }

  /// Logout dan hapus token di server Django.
  Future<void> logout({required String token}) async {
    final response = await _client.post(
      _uri('/api/v1/auth/logout/'),
      headers: _headers(token: token),
    );

    if (response.statusCode != 200 && response.statusCode != 204) {
      throw ApiException(
        'Gagal logout (${response.statusCode})',
        statusCode: response.statusCode,
      );
    }
  }

  /// Menambahkan pengalaman baru ke backend Django (butuh token).
  Future<Experience> createExperience({
    required Experience experience,
    required String token,
  }) async {
    final response = await _client.post(
      _uri('/api/v1/experiences/'),
      headers: _headers(token: token),
      body: jsonEncode(experience.toJson()),
    );

    if (response.statusCode != 201) {
      throw ApiException(
        'Gagal menyimpan pengalaman (${response.statusCode}): ${response.body}',
        statusCode: response.statusCode,
      );
    }

    final data = jsonDecode(response.body) as Map<String, dynamic>;
    return Experience.fromJson(data);
  }
}
