import 'package:flutter/material.dart';
import 'package:g_02/presentation/screens/home_screen/home_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Text("Login Screen"),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (builder) => MyHomePage(title: "push navigation"),
                  ),
                );
              },
              icon: Icon(Icons.arrow_back_sharp, color: Colors.blue),
            ),
          ],
        ),
      ),
    );
  }
}
