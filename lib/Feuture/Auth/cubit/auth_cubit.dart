import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  void Register({required String email, required String password}) async {
    emit(LoadingSate());
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      emit(AuthSignSucsess());
    } on FirebaseException catch (e) {
      emit(AuthSignFaliure(errmessage: '${e.message}'));
    }
  }

  void Login({required String email, required String password}) async {
    emit(LoadingSate());
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      if (userCredential.user?.uid != null) {
        final sharedPref = await SharedPreferences.getInstance();
        await sharedPref.setString('userId', userCredential.user!.uid);
        emit(AuthLoginSucsess());
      }
    } on FirebaseException catch (e) {
      emit(AuthLoginFaliure(errmessage: '${e.message}'));
    }
  }

  Future<UserCredential?> signInWithGoogle() async {
    emit(LoadingSate());
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      emit(googleSignSucsess());
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } on Exception catch (e) {
      emit(googleSignFaliure(errmessage: e.toString()));
      return null;
    }
  }

  ///

  ///

  Future<UserCredential?> signInWithFacebook() async {
    emit(LoadingSate());
    try {
      final LoginResult loginResult = await FacebookAuth.instance.login();

      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.token);
      emit(FacebookSignSucsess());

      return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
    } on Exception catch (e) {
      emit(FacebookSignFaliure(errmessage: e.toString()));
      return null;
    }
  }

  void deleteAccount() async {
    final userCredential = await FirebaseAuth.instance;
    userCredential.currentUser!.delete();
  }
}
