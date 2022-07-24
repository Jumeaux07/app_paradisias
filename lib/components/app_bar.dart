import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ApBar extends StatelessWidget {
  final String icon;
  final String name;
  const ApBar({ Key? key, required this.icon, required this.name }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return           Container(
            decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius:BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10)
              )
            ),
            padding: EdgeInsets.all(20),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, 
            children: [
              SvgPicture.asset(this.icon, color: Colors.teal, height: 35,),
              Row(children: [
              Text(this.name, style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
              // Text('Dashbord', style: TextStyle(fontSize: 20),)
              ],)
            ],),
          );
  }
}