import 'package:chat_app/screen/massage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'conestans.dart';
class ChatBuble extends StatelessWidget {
  const ChatBuble({
    Key? key,
    required this.massage,
  }) : super(key: key);
  final Massage massage;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.only(left: 16, top: 32, bottom: 32, right: 32),
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
              bottomRight: Radius.circular(32),
            ),
            color: KPrimaryColor),
        child: Text(
          massage.massage,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
class ChatBublee extends StatelessWidget {
  const ChatBublee({
    Key? key,
    required this.massage,
  }) : super(key: key);
  final Massage massage;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.only(left: 16, top: 32, bottom: 32, right: 32),
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
              bottomLeft: Radius.circular(32),
            ),
            color: Color(0xff006D84)),
        child: Text(
          massage.massage,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

