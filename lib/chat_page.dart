import 'package:chat_app/chatbuble.dart';
import 'package:chat_app/screen/cuibt/chat.dart';
import 'package:chat_app/screen/cuibt/chat_cubit.dart';
import 'package:chat_app/screen/massage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'conestans.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatPage extends StatelessWidget {
  static String id = 'chatpage';
  final _controller = ScrollController();

  TextEditingController controller = TextEditingController();
  List<Massage> massagelist = [];

  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: KPrimaryColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              'https://raw.githubusercontent.com/tharwatsamy/scholar_chat_setup/main/assets/images/scholar.png',
              height: 50,
            ),
            Text(' chat'),
          ],
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child:
                BlocConsumer<ChatCubit, ChatState>(
                    listener: (context, state) {
              if (state is ChatSuccess) {
                massagelist = state.massages;
              }
            }, builder: (context, state) {
              return ListView.builder(
                  reverse: true,
                  controller: _controller,
                  itemCount: massagelist.length,
                  itemBuilder: (context, index) {
                    return massagelist[index].id == email
                        ? ChatBuble(massage: massagelist[index])
                        : ChatBuble(massage: massagelist[index]);
                  });
            }),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: controller,
              onSubmitted: (data) {
                BlocProvider.of<ChatCubit>(context)
                   .sendMassege(Massage: 'Massage', email: 'email');
                controller.clear();
                _controller.animateTo(
                  0,
                  // _controller.position.maxScrollExtent,
                  duration: Duration(seconds: 1),
                  curve: Curves.fastOutSlowIn,
                );
              },
              decoration: InputDecoration(
                hintText: 'send Massage',
                suffixIcon: Icon(
                  Icons.send,
                  color: KPrimaryColor,
                ),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(
                    color: KPrimaryColor,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
