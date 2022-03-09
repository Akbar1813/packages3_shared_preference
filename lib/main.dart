import 'package:flutter/material.dart';
import 'package:packages3_shared_preference/pages/home_page.dart';
import 'package:packages3_shared_preference/pages/signIn_page.dart';
import 'package:packages3_shared_preference/pages/signUp_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SignInPage(),
      routes: {
        HomePage.id: (context) => HomePage(),
        SignInPage.id: (context) => SignInPage(),
        SignUpPage.id: (context) => SignUpPage()
      },
    );
  }
}
