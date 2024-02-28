import 'package:dio/dio.dart';
import 'package:flutter_application_1/models/user_model.dart';

class UserService {
  final String baseUrl = 'https://jsonplaceholder.typicode.com';
  final String usersPath = "/users";
  final dio = Dio();

  Future<List<UserModel>> getAllUsers() async {
    List<UserModel> usersList = [];
    final String path = "$baseUrl/$usersPath";
    final res = await dio.get(path);
    res.data.forEach((user) => {usersList.add(UserModel.fromJson(user))});
    return usersList;
  }

  Future<UserModel> getUserById(int id) async {
    final String path = "$baseUrl/$usersPath?id=$id";
    final res = await dio.get(path);
    UserModel user = UserModel.fromJson(res.data[0]);
    return user;
  }
}
