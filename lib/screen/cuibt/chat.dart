import 'package:flutter/cupertino.dart';

import '../massage.dart';

@immutable
abstract class ChatState {}

class ChatInitial extends ChatState {}
class ChatSuccess extends ChatState {
  List <Massage> massages;
  ChatSuccess({required this.massages});

}