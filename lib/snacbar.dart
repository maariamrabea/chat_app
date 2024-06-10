import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

 void  showSnacBar(BuildContext context, String massage) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        massage,
      )));
}