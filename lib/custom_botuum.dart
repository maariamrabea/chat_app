import 'package:flutter/material.dart';

class CustomButtom extends StatelessWidget{
   CustomButtom({required this.text,this .onTap});
   VoidCallback?onTap;
  String text;
  @override
  Widget build(BuildContext context) {
   return GestureDetector(
onTap: onTap,
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      width: double.infinity,
      height: 60,
      child:Center(
        child: Text(text),
      ),
     ),);
  }

}