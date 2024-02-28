import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/user_model.dart';
import 'package:flutter_application_1/services/users_service.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  List<UserModel> userList = [];
  final userService = UserService();
  bool isLoading = true;

  getData() async {
    userList = await userService.getAllUsers();
    isLoading = false;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.separated(
              itemCount: userList.length,
              separatorBuilder: (BuildContext context, int index) {
                return const Divider(
                  height: 20,
                  thickness: 2,
                  indent: 20,
                  endIndent: 0,
                  color: Colors.black54,
                );
              },
              itemBuilder: (BuildContext context, int index) {
                return UserCard(userList[index]);
              },
            ),
    );
  }
}

class UserCard extends StatelessWidget {
  final UserModel user;
  const UserCard(
    this.user, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: const Icon(Icons.contact_page_outlined),
            title: Text(user.name),
            subtitle: Text(user.email),
          ),
        ],
      ),
    );
  }
}
