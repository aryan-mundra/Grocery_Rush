import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:foodpanda_admin_web/authentication/login_screen.dart';

import 'main_screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    // Replace with actual values
      options: FirebaseOptions(
        apiKey: "AIzaSyC2O3feLA1nnF4Uw0LZGqNOd7Svj8t4XfU",
        appId: "1:457730968702:web:e4cf516e609f0554659c2f",
        messagingSenderId: "457730968702",
        projectId: "foodpanda-clone-app-5e8ca",
    ),
  );
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Admin Web Portal",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home:FirebaseAuth.instance.currentUser == null ? const LoginScreen() : const HomeScreen(),
    );
  }
}


