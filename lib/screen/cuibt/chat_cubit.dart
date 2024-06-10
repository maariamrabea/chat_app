import 'package:chat_app/screen/cuibt/chat.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../massage.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit():super(ChatInitial());

  CollectionReference massage =
      FirebaseFirestore.instance.collection('KeyMessageCollections');

  void sendMassege({required String Massage, required String email}) {
    try {
      massage
          .add({'massage': massage, 'createdAt': DateTime.now(), 'id': email});
    } on Exception catch (e) {}
  }

  void getMassage() {
    massage.orderBy('createdAt', descending: true).snapshots().listen((event) {
      List <Massage> MassageList=[];
      for(var  doc in event.docs){
        MassageList.add(Massage.fromJson(doc));
      }
      emit(ChatSuccess(massages: MassageList));
    });
  }
}
