import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:second_flutter_project/fashion_home.dart';
import 'package:second_flutter_project/uihelper.dart';

class signup_Page extends StatefulWidget {
  const signup_Page({super.key});

  @override
  State<signup_Page> createState() => signup_pagestate();
}

class signup_pagestate extends State<signup_Page> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  signup(String email, String password) async {
    if (email == "" && password == "") {
      UiHelper.CustomAlertBox(context, "Enter Required Fields");
    } else {
      UserCredential? usercredential;
      try {
        usercredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((value) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      FashionHomeScreen()));
        });
      } on FirebaseAuthException catch (ex) {
        return UiHelper.CustomAlertBox(context, ex.code.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Sign Up Page",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.purple.shade800,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          UiHelper.customtextfield(
              emailController, "Email", Icons.mail, false),
          UiHelper.customtextfield(
              passwordController, "Password", Icons.password, true),
          const SizedBox(height: 30),
          UiHelper.CustomButton(() {
            signup(emailController.text.toString(), passwordController.text.toString());
          }, "Sign Up"),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
