import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/layout/nav_layout.dart';
import 'package:flutter_application_1/views/screens/register_page.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _myFormKey = GlobalKey<FormState>();
  bool isObs = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _myFormKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircleAvatar(
                radius: 100,
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
                  obscureText: isObs,
                  decoration: InputDecoration(
                    suffix: IconButton(
                        onPressed: () {
                          setState(() {
                            isObs = !isObs;
                          });
                        },
                        icon: isObs
                            ? const Icon(Icons.visibility)
                            : const Icon(Icons.visibility_off)),
                    label: const Text("Password"),
                    icon: const Icon(Icons.password),
                    border: const OutlineInputBorder(),
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
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => NavLayout()));
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
                  TextButton(
                      onPressed: () => {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const RegisterPage()))
                          },
                      child: const Text("register"))
                ],
              ),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const RegisterPage()));
                  },
                  child: const Text("forget password"))
            ],
          ),
        ),
      ),
    );
  }
}
