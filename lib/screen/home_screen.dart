import 'dart:convert';

import 'package:app_paradisias/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

User? user;

class _HomeScreenState extends State<HomeScreen> {
  void _getUser() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      final data = pref.getString("user");
      user = User.fromJson(json.decode(data!));
      print(user);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    _getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Text('Bonjour ${user!.username}')),
    );
  }
}
