import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  static const String _userKey = 'users';

  // Simpan user baru
  Future<void> registerUser(String email, String password) async {
    final prefs = await SharedPreferences.getInstance();
    final users = await getUsers();
    users[email] = password;
    await prefs.setString(_userKey, jsonEncode(users));
  }

  // Ambil semua user
  Future<Map<String, String>> getUsers() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(_userKey);
    if (data == null) return {};
    final Map<String, dynamic> map = jsonDecode(data);
    return map.map((k, v) => MapEntry(k, v.toString()));
  }

  // Validasi login
  Future<bool> validateUser(String email, String password) async {
    final users = await getUsers();
    return users[email] == password;
  }

  // Cek apakah email sudah terdaftar
  Future<bool> isEmailRegistered(String email) async {
    final users = await getUsers();
    return users.containsKey(email);
  }
}
