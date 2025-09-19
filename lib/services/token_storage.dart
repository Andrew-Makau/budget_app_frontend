import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenStorage {
  // Create a secure storage instance
  final _storage = const FlutterSecureStorage();

  // Save JWT token
  Future<void> saveToken(String token) async {
    await _storage.write(key: "jwt_token", value: token);
  }

  // Read JWT token
  Future<String?> getToken() async {
    return await _storage.read(key: "jwt_token");
  }

  // Delete JWT token (logout)
  Future<void> deleteToken() async {
    await _storage.delete(key: "jwt_token");
  }
}
