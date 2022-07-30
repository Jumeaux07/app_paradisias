import 'package:app_paradisias/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MenuBtn extends StatelessWidget {
  final String title;
  final String icon;
  const MenuBtn({ Key? key, required this.title, required this.icon }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return  Container(
                // padding: EdgeInsets.all(10),
                width: size.width*0.2,
                height: size.width*0.2,
                decoration:BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                  boxShadow:[
                    BoxShadow(
                      color: Colors.grey.shade500,
                      // offset: Offset(0, 2),
                      spreadRadius: 2,
                      blurRadius: 3,
                  )]
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SvgPicture.asset(this.icon, color: Colors.teal,),
                    Text(this.title, style: TextStyle(fontSize: size.width*0.04, color:Colors.teal),)
                  ],
                ),
              );
  }
}