import 'package:flutter/material.dart';
import 'login.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Take Break';

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        body: LoginPage(),
      ),
    );
  }
}


