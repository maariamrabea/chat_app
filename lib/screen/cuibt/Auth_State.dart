import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'AuthCubet.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit():super(AuthInitial());


  Future<void> loginUser(
      {required String email, required String password}) async {
    emit(LoginLoading());
    try {
      UserCredential user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      emit(LoginSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user not found') {
        emit(LoginFalier(errMassege: 'user not found'));
      } else if (e.code == 'wrong password') {
        emit(LoginFalier(errMassege: 'wrong password'));
      }
    } catch (e) {
      emit(LoginFalier(errMassege: 'something went wrong'));
    }
  }

  Future<void> registerUser(
      {required String email, required String password}) async {
    emit(RegisterLoading());
    try {
      UserCredential user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      emit(RegisterSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak password') {
        emit(RegisterFalier(errMassege: 'weak password'));
      } else if (e.code == 'email already in use') {
        emit(RegisterFalier(errMassege: 'email already in use'));
      }
    } catch (e) {
      emit(RegisterFalier(errMassege: 'something went wrong'));
    }
  }
}
