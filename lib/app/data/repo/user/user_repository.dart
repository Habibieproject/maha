import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:maha/app/data/endpoint/endpoint.dart';
import 'package:maha/app/data/models/response/user_response.dart';
import 'package:maha/app/data/repo/user/base_user_repository.dart';

class UserRepository extends BaseUserRepository {
  @override
  Future<List<User>> fetchUsers(int page) async {
    final response =
        await http.get(Uri.parse('${EndPoints.baseURL}/users?page=$page'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final users =
          (data['data'] as List).map((json) => User.fromJson(json)).toList();
      return users;
    } else {
      throw Exception('Gagal mengambil data user');
    }
  }

  @override
  Future<Map<String, dynamic>> postUser(String name, String job) async {
    final response = await http.post(
      Uri.parse('${EndPoints.baseURL}/users'),
      body: json.encode({'name': name, 'job': job}),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 201) {
      return json.decode(response.body);
    } else {
      throw Exception('Gagal menambahkan user');
    }
  }
}
