import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:g_02/core/app_colors/app_colors.dart';
import 'package:g_02/presentation/screens/home_screen/home_screen.dart';

class LoginScreen extends StatefulWidget {
   LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
   TextEditingController? emailController=TextEditingController();

   GlobalKey<FormState> loginKey = GlobalKey<FormState>();

   bool isVisiable=false;

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: loginKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Login",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                Text(
                  "please enter your login data",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
                ),
                SizedBox(height: 128),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (input){
                    if(!input!.contains("@")){
                      return "invalid email";
                    }
                    else if(input==""){
                      return "Email is required";
                    }
                    else{
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    enabled: true,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    hintText: "example@example.com",
                    hintStyle: TextStyle(color: AppColors.greyColor),
                    prefixIcon: Icon(
                      Icons.email_outlined,
                      color: AppColors.greyColor,
                    ),
                  ),
                ),
                SizedBox(height: 16),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,

                  keyboardType: TextInputType.visiblePassword,
                  validator: (input){
                    if(input==""){
                      return "invalid password";
                    }
                    else if(input!.length <8){
                      return "password must be 8 characters at least";
                    }
                    else{
                      return null;
                    }
                  },
                  obscureText: !isVisiable,
                  decoration: InputDecoration(
                    enabled: true,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),

                    hintText: "********",
                    hintStyle: TextStyle(color: AppColors.greyColor),
                    prefixIcon: Icon(
                      Icons.lock_outline,
                      color: AppColors.greyColor,
                    ),
                    suffixIcon: IconButton(onPressed: () {
                      setState(() {
                        isVisiable=!isVisiable;
                      });

                      log(isVisiable.toString());
                    }, icon:isVisiable?Icon(Icons.visibility): Icon(Icons.visibility_off),
                   ),
                  ),
                ),
                SizedBox(height: 100),
                MaterialButton(
                  color: AppColors.mainColor,
                  height: 56,
                  minWidth: MediaQuery.of(context).size.width,
                  onPressed: () {
                    if(loginKey.currentState!.validate()){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (builder) => MyHomePage(email: emailController!.text),
                      ),
                    );}
                  },
                  child: Text("Login"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
