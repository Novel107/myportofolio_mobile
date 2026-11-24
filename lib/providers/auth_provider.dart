import 'package:flutter/foundation.dart';
import 'package:myportofolio_mobile/services/api_client.dart';

class AuthProvider extends ChangeNotifier {
  AuthProvider({ApiClient? apiClient}) : _apiClient = apiClient ?? ApiClient();

  final ApiClient _apiClient;

  String? _token;
  String? _username;
  bool _isLoading = false;

  String? get token => _token;
  String? get username => _username;
  bool get isLoading => _isLoading;
  bool get isAuthenticated => _token != null && _token!.isNotEmpty;

  Future<void> login({
    required String username,
    required String password,
  }) async {
    _isLoading = true;
    notifyListeners();

    try {
      final token = await _apiClient.login(
        username: username,
        password: password,
      );
      _token = token;
      _username = username;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> logout() async {
    final currentToken = _token;
    if (currentToken == null) return;

    _isLoading = true;
    notifyListeners();

    try {
      await _apiClient.logout(token: currentToken);
    } finally {
      _token = null;
      _username = null;
      _isLoading = false;
      notifyListeners();
    }
  }
}