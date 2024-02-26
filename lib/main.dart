import 'package:flutter/material.dart';
import 'package:flutter_application_1/signup.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _myFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        foregroundColor: Colors.black,
        leading: const Icon(Icons.phone),
        title: const Text("flutter day 2"),
        actions: [
          IconButton(
            icon: const Icon(Icons.notification_important),
            onPressed: () => {},
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _myFormKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircleAvatar(
                child: Image.network(
                  "https://lush.com.ph/cdn/shop/articles/sunflower_petal_infusion_1024x1024.jpg?v=1562727399",
                ),
              ),
              TextFormField(
                  decoration: const InputDecoration(
                    label: Text("Email"),
                    icon: Icon(Icons.email),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  }),
              TextFormField(
                  decoration: const InputDecoration(
                    label: Text("Password"),
                    icon: Icon(Icons.password),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  }),
              MaterialButton(
                onPressed: () {
                  if (_myFormKey.currentState!.validate()) {
                    print("Done!!!");
                  }
                },
                color: Colors.amber,
                textColor: Colors.brown,
                child: Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: const Center(
                    child: Text(
                      "Log in",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("data"),
                  TextButton(onPressed: () => {}, child: const Text("register"))
                ],
              ),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const SignUpPage()));
                  },
                  child: const Text("forget password"))
            ],
          ),
        ),
      ),
    );
  }
}
