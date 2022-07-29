import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:zoom_clone/Screens/SignUpScreen.dart';
import 'package:zoom_clone/Screens/homeScreen.dart';
import 'package:zoom_clone/Screens/videoCallScreen.dart';
import 'package:zoom_clone/Utils/colors.dart';
import 'package:zoom_clone/res/auth_meth.dart';

void main() async {
  
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Zoom Clone',
      theme:
          ThemeData.dark().copyWith(scaffoldBackgroundColor: backgroundColor),
      routes: {
        '/login': (context) => const SignUpPage(),
        '/HomeScreen': (context) => const HomeScreen(),
        '/video-call':(context) => VideoCallScreen()
      },
      home: StreamBuilder(
        stream: AuthMeth().authChanges,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasData) {
            return const HomeScreen();
          }
          return SignUpPage();
        },
      ),
    );
  }
}
