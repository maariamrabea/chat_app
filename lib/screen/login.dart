import 'package:chat_app/conestans.dart';
import 'package:chat_app/screen/cuibt/AuthCubet.dart';
import 'package:chat_app/screen/cuibt/Auth_State.dart';
import 'package:chat_app/widgets.dart';
import 'package:chat_app/chat_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../custom_botuum.dart';

// love ur effort and u:)

class LoginPageState extends StatelessWidget {
  late String email;
  late String password;
  bool isLoading = false;
  static String id = 'LoginPage';
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is LoginLoading) {
            isLoading = true;
          } else if (state is LoginSuccess) {
            Navigator.pushNamed(context, ChatPage.id);
          isLoading=false;
          } else if (state is LoginFalier) {
            Navigator.pushNamed(context, state.errMassege);
            isLoading=false;
          }
        },
        builder:(context,state)=> ModalProgressHUD(
            inAsyncCall: isLoading,
            child: Scaffold(
              backgroundColor: KPrimaryColor,
              body: ModalProgressHUD(
                inAsyncCall: isLoading,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 17),
                  child: Form(
                    key: formKey,
                    child: ListView(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Image.network(
                            height: 250,
                            width: double.infinity,
                            'https://raw.githubusercontent.com/tharwatsamy/scholar_chat_setup/main/assets/images/scholar.png'),
                        const Text(
                          'Scholar chat',
                          style: TextStyle(fontSize: 40, color: Colors.white),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: const [
                            Text(
                              'Login',
                              style:
                                  TextStyle(fontSize: 30, color: Colors.white),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        CustomFormTextField(
                          onChanged: (data) {
                            email = data;
                          },
                          hintText: 'Enter your email',
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomFormTextField(
                          obscureText: true,
                          onChanged: (data) {
                            password = data;
                          },
                          hintText: 'Password',
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        CustomButtom(
                          onTap: () async {
                            if (formKey.currentState!.validate()) {
                              BlocProvider.of<AuthCubit>(context).loginUser(
                                  email: email, password: password);

                            } else {}
                          },
                          text: 'Login',
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'already have an account',
                              style: TextStyle(color: Colors.white),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, AuthCubit() as String);
                              },
                              child: Text(
                                '   REGISTER',
                                style: TextStyle(color: Color(0xffC7EDE6)),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )));
  }
}
