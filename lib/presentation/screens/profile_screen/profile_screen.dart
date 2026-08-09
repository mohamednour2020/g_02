import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Text("Profile Screen"),
            IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back_sharp)),
          ],
        ),
      ),
    );
  }
}
