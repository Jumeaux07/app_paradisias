import 'dart:convert';

import 'package:app_paradisias/components/app_bar.dart';
import 'package:app_paradisias/components/card.dart';
import 'package:app_paradisias/constant.dart';
import 'package:app_paradisias/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

User? user;
  final DateTime now = DateTime.now();
  final DateFormat formatter = DateFormat('dd-MM-yyyy');
  final String date = formatter.format(now);
  final _controller = PageController();

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
      backgroundColor: Colors.grey[300],
      body:SafeArea(
        child: Column(children: [
          //Appbar
          ApBar(icon: statistique_icon, name: 'Dashbord'),
          SizedBox(height: 20,),

          //Carte Total du Revenu
          Container(
            height: 250,
            padding: EdgeInsets.all(25),
            child: PageView(
              controller: _controller,
              scrollDirection: Axis.horizontal,
              children: [
                CardApp(title: 'Bénéfice', icon: carte_de_credit_icon, montant: '1500 000F', date: date, color: Colors.teal,),
                CardApp(title: 'Entrés', icon: carte_de_credit_icon, montant: '1500 000F', date: date, color: Colors.orange,),
                CardApp(title: 'Dépenses', icon: carte_de_credit_icon, montant: '1500 000F', date: date, color: Colors.deepPurple,),
              ],
            ),
          ),
          SmoothPageIndicator(
            controller: _controller,
            count: 3,
            effect: JumpingDotEffect(dotColor: Colors.white,activeDotColor: Colors.teal),
          )
          //Button d'autres actions
      
          //Statistique des reservation
        ],),
      ),
    );
  }
}
