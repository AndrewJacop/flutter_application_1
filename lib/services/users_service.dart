import 'package:dio/dio.dart';
import 'package:flutter_application_1/models/user_model.dart';

class UserService {
  final String baseUrl = 'https://jsonplaceholder.typicode.com';
  final String usersPath = "/users";
  final dio = Dio();

  Future<List<UserModel>> getAllUsers() async {
    List<UserModel> usersList = [];
    final res = await dio.get("$baseUrl/$usersPath");
    res.data.forEach((user) => {usersList.add(UserModel.fromJson(user))});
    return usersList;
  }

  Future<UserModel> getUserById(int id) async {
    final res = await dio.get("$baseUrl/$usersPath?id=$id");
    return UserModel.fromJson(res.data);
  }
}
