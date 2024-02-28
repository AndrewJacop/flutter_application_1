import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/screens/chat_details_page.dart';
import 'package:flutter_application_1/views/screens/search_pages.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const SearchPage()));
              },
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.grey.shade200,
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    children: [Icon(Icons.search), Text("search")],
                  ),
                ),
              ),
            ),
            const HorizontalScroll(),
            const Expanded(child: VerticalScroll()),
          ],
        ),
      ),
    );
  }
}

class HorizontalScroll extends StatelessWidget {
  const HorizontalScroll({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ActiveUserAvatar('Andrew Jacop'),
          ActiveUserAvatar('Andrew Jacop'),
          ActiveUserAvatar('Andrew Jacop'),
          ActiveUserAvatar('Andrew Jacop'),
          ActiveUserAvatar('Andrew Jacop'),
          ActiveUserAvatar('Andrew Jacop'),
          ActiveUserAvatar('Andrew Jacop'),
          ActiveUserAvatar('Andrew Jacop'),
          ActiveUserAvatar('Andrew Jacop'),
          ActiveUserAvatar('Andrew Jacop'),
          ActiveUserAvatar('Andrew Jacop'),
        ],
      ),
    );
  }
}

class ActiveUserAvatar extends StatelessWidget {
  final String username;
  const ActiveUserAvatar(this.username, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const CircleAvatar(radius: 40),
          Text(
            username,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }
}

class VerticalScroll extends StatelessWidget {
  const VerticalScroll({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          ChatBox(userName: 'Abd EL Khalek', chatText: 'Hello'),
          ChatBox(userName: 'Ahmad EL NAgary', chatText: 'It\'s me'),
          ChatBox(userName: 'Abdo', chatText: 'I was wondering'),
          ChatBox(
              userName: 'Hassan Bsheeer',
              chatText: 'if after all these years you\'d like to meet'),
          ChatBox(
              userName: 'Abdalla Korayem',
              chatText: 'Hello from the other side'),
          ChatBox(
              userName: 'Ahmad Ramadan',
              chatText: 'I\ve must have called a thousand times'),
          ChatBox(
              userName: 'Mahmood Abbas',
              chatText: 'to tell you that I\'m sorry'),
          ChatBox(userName: 'Abd EL Khalek', chatText: 'Hello'),
          ChatBox(userName: 'Ahmad EL NAgary', chatText: 'It\'s me'),
          ChatBox(userName: 'Abdo', chatText: 'I was wondering'),
          ChatBox(
              userName: 'Hassan Bsheeer',
              chatText: 'if after all these years you\'d like to meet'),
          ChatBox(
              userName: 'Abdalla Korayem',
              chatText: 'Hello from the other side'),
          ChatBox(
              userName: 'Ahmad Ramadan',
              chatText: 'I\ve must have called a thousand times'),
          ChatBox(
              userName: 'Mahmood Abbas',
              chatText: 'to tell you that I\'m sorry'),
          ChatBox(userName: 'Abd EL Khalek', chatText: 'Hello'),
          ChatBox(userName: 'Ahmad EL NAgary', chatText: 'It\'s me'),
          ChatBox(userName: 'Abdo', chatText: 'I was wondering'),
          ChatBox(
              userName: 'Hassan Bsheeer',
              chatText: 'if after all these years you\'d like to meet'),
          ChatBox(
              userName: 'Abdalla Korayem',
              chatText: 'Hello from the other side'),
          ChatBox(
              userName: 'Ahmad Ramadan',
              chatText: 'I\ve must have called a thousand times'),
          ChatBox(
              userName: 'Mahmood Abbas',
              chatText: 'to tell you that I\'m sorry'),
        ],
      ),
    );
  }
}

class ChatBox extends StatelessWidget {
  final String userName;
  final String chatText;
  const ChatBox({
    super.key,
    required this.userName,
    required this.chatText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => const MsgPage()));
        },
        child: Row(
          children: [
            const CircleAvatar(radius: 32),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userName,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(chatText)
                ],
              ),
            )),
            const Row(
              children: [
                Text("am"),
                CircleAvatar(radius: 2, backgroundColor: Colors.black),
                Text('10:30')
              ],
            )
          ],
        ),
      ),
    );
  }
}
