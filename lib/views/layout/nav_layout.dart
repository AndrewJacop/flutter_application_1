import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/screens/albums_page.dart';
import 'package:flutter_application_1/views/screens/chat_page.dart';
import 'package:flutter_application_1/views/screens/profile_screen.dart';
import 'package:flutter_application_1/views/screens/users_page.dart';

class NavLayout extends StatefulWidget {
  const NavLayout({super.key});

  @override
  State<NavLayout> createState() => _NavLayoutState();
}

class _NavLayoutState extends State<NavLayout> {
  final List pages = [
    const ChatScreen(),
    const UsersScreen(),
    const ProfileScreen(),
    const AlbumsScreen(),
  ];

  final List appBarTitles = [
    "Chat",
    "Users",
    "Profile",
    "Albums",
  ];

  int _currentIdx = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.blue,
        elevation: 5,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: CircleAvatar(
                backgroundColor: Colors.grey.shade300,
                child:
                    IconButton(onPressed: () {}, icon: const Icon(Icons.edit))),
          )
        ],
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: CircleAvatar(
                child: Image.network(
                  "https://lush.com.ph/cdn/shop/articles/sunflower_petal_infusion_1024x1024.jpg?v=1562727399",
                ),
              ),
            ),
            Text(
              appBarTitles[_currentIdx],
              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 26),
            )
          ],
        ),
      ),
      body: pages[_currentIdx],
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.blue,
        unselectedItemColor: Colors.grey.shade400,
        elevation: 5,
        currentIndex: _currentIdx,
        onTap: (idx) {
          setState(() {
            _currentIdx = idx;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Chat"),
          BottomNavigationBarItem(
              icon: Icon(Icons.supervised_user_circle), label: "Users"),
          BottomNavigationBarItem(
              icon: Icon(Icons.contact_page), label: "Profile"),
          BottomNavigationBarItem(icon: Icon(Icons.album), label: "Albums"),
        ],
      ),
    );
  }
}
