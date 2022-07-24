import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CardApp extends StatelessWidget {
  final String title;
  final String icon;
  final String montant;
  final String date;
  final Color color;
  const CardApp({ Key? key, required this.title, required this.icon, required this.montant, required this.date, required this.color }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: this.color,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(this.title, style: TextStyle(color: Colors.white, fontSize: 25),),
                        SvgPicture.asset(this.icon, color: Colors.white,),
                      ],
                    ),
                    Text(this.montant,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 55,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    Row(
                      mainAxisAlignment:MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Date',style: TextStyle(color: Colors.white, fontSize: 15)),
                        Text(date,style: TextStyle(color: Colors.white, fontSize: 15)),
                      ],
                    )
                  ],
                ),
              ),
    );
  }
}