import 'package:flutter/material.dart';
import 'package:zoom_clone/Screens/homeScreen.dart';
import 'package:zoom_clone/Widgets/custom_button.dart';
import 'package:zoom_clone/res/auth_meth.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final AuthMeth _authMeth = AuthMeth();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text(
            'Start or join a meeting',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Image.asset(
            "Assets/images/image1.jpg",
          ),
          CustomButton(
            line: 'Google Signin',
            OnPressed: () async {
              bool res = await AuthMeth().signInWithGoogle(context);
              if (res) {
                Navigator.pushNamed(context, '/HomeScreen');
              }
            },
          ),
        ],
      ),
    );
  }
}
