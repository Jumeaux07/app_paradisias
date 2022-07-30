import 'package:app_paradisias/screen/login_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Paradisias',
      theme: ThemeData(primarySwatch: Colors.teal, fontFamily: 'Raleway'),
      home: LoginScreen()
    );
  }
}
