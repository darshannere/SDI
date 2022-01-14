import 'package:flutter/material.dart';
import 'package:sdppr/calorieapi.dart';
import 'package:sdppr/homepage.dart';
import 'package:sdppr/login/signup.dart';
import 'login/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: 'nutrition',
      routes: {
        'home': (context) => homepage(),
        '/': (context) => LoginScreen(),
        'signup': (context) => Signup(),
        'nutrition': (context) => Nutritionpage(),
      },
    );
  }
}
