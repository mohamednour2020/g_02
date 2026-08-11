import 'package:flutter/material.dart';
import 'package:g_02/presentation/screens/home_screen/home_screen.dart';

import 'presentation/screens/login_screen/login_screen.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home:  LoginScreen(),
    );
  }
}

