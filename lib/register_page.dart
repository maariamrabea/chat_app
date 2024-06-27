import 'package:chat_app/screen/cuibt/AuthCubet.dart';
import 'package:chat_app/screen/cuibt/Auth_State.dart';
import 'package:chat_app/screen/login.dart';
import 'package:chat_app/snacbar.dart';
import 'package:chat_app/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'chat_page.dart';
import 'conestans.dart';
import 'custom_botuum.dart';


class RegisterScreenState extends StatelessWidget {
  late String email;
  late String password;
  bool isLoading = false;
  static String id = 'RegisterPage';
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is LoginLoading) {
            isLoading = true;
          } else if (state is LoginSuccess) {
            Navigator.pushNamed(context, ChatPage.id);
            isLoading = false;
          } else if (state is LoginFalier) {
            Navigator.pushNamed(context, state.errMassege);
            isLoading = false;
          }
        },
        builder: (context, state) => ModalProgressHUD(
            inAsyncCall: isLoading,
            child: Scaffold(
              backgroundColor: KPrimaryColor,
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 17),
                child: Form(
                  key: formKey,
                  child: ListView(
                    children: [

                      Image.network(
                          height: 250,
                          'https://raw.githubusercontent.com/tharwatsamy/scholar_chat_setup/main/assets/images/scholar.png'),
                      const Text(
                        'Scholar chat',
                        style: TextStyle(fontSize: 40, color: Colors.white),
                      ),


                      Row(
                        children: const [
                          Text(
                            'Register',
                            style: TextStyle(fontSize: 30, color: Colors.white),
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
                            isLoading = true;

                            try {
                              await registerUser();

                              Navigator.pushNamed(context, ChatPage.id);
                            } on FirebaseAuthException catch (e) {
                              if (e.code == 'weak-password') {
                                showSnacBar(context, 'waek passwoed');
                              } else if (e.code == 'email-already-in-use') {
                                showSnacBar(context, 'email already exists');
                              }
                            } catch (e) {
                              showSnacBar(context, 'there was an error');
                            }
                            isLoading = true;
                            //
                          } else {}
                        },
                        text: 'Regisiter',
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
                              Navigator.pop(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return LoginPageState();
                                  },
                                ),
                              );
                            },
                            child: Text(
                              '   Login',
                              style: TextStyle(color: Color(0xffC7EDE6)),
                            ),
                          ),
                        ],
                      ),

                    ],
                  ),
                ),
              ),
            )));
  }

  Future<void> registerUser() async {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
  }
}
