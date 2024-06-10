import 'package:chat_app/chat_page.dart';
import 'package:chat_app/register_page.dart';
import 'package:chat_app/screen/cuibt/Auth_State.dart';
import 'package:chat_app/screen/cuibt/chat_cubit.dart';
import 'package:chat_app/screen/login.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'firebase_options.dart';

//import 'firebase_options.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const Scholarchat());
}

class Scholarchat extends StatelessWidget {
  const Scholarchat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit()),
        BlocProvider(create: (context) => ChatCubit()),

      ],
      child: MaterialApp(
        routes: {
          LoginPageState.id: (context) => LoginPageState(),
          RegisterScreenState.id: (context) => RegisterScreenState(),
          ChatPage.id: (context) => ChatPage(),
        },
        initialRoute: LoginPageState.id,
      ),
    );
  }
}
