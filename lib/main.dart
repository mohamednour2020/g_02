import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:g_02/presentation/cubits/popular_people_cubit/popular_people_cubit.dart';
import 'package:g_02/presentation/screens/home_screen/home_screen.dart';

import 'presentation/screens/login_screen/login_screen.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    
    return MultiBlocProvider(
      providers: [
        BlocProvider<PopularPeopleCubit>(
          create: (context) => PopularPeopleCubit()),
        
      ],
      child: const MaterialApp(
        title: 'MultiBlocProvider App',
        home: MyHomePage(email: "email"),
      ),
    );
  }
}

