import 'package:maha/app/data/models/response/user_response.dart';

abstract class BaseUserRepository {
  Future<List<User>> fetchUsers(int page);
  Future<Map<String, dynamic>> postUser(String name, String job);
}
