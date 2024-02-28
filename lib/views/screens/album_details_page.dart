import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/album_model.dart';
import 'package:flutter_application_1/models/user_model.dart';
import 'package:flutter_application_1/services/users_service.dart';

class AlbumDetailsScreen extends StatefulWidget {
  final AlbumModel album;
  const AlbumDetailsScreen(this.album, {super.key});

  @override
  State<AlbumDetailsScreen> createState() => _AlbumDetailsScreenState();
}

class _AlbumDetailsScreenState extends State<AlbumDetailsScreen> {
  UserModel? user;
  final userService = UserService();
  bool isLoading = true;

  getUserData() async {
    user = await userService.getUserById(widget.album.userId);
    isLoading = false;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: isLoading
            ? const CircularProgressIndicator()
            : Card(
                elevation: 10, // adds a shadow effect
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(15.0), // adds rounded corners
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        widget.album.title,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text("User: ${user!.name}"),
                      const SizedBox(
                          height:
                              10), // adds spacing between the text and image
                      const CircleAvatar(radius: 60),
                      const SizedBox(
                          height:
                              10), // adds spacing between the image and button
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Back'),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
