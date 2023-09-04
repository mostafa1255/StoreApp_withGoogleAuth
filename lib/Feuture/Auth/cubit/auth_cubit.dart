import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  final auth = FirebaseAuth.instance;
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

  Future<void> verifyEmail() async {
    try {
      auth.currentUser!.sendEmailVerification();
    } catch (e) {
      print(e.toString());
    }
  }

  void Login({required String email, required String password}) async {
    emit(LoadingSate());
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      if (userCredential.user?.uid != null) {
        print("in Auth Cubit" + userCredential.user!.uid);
        final sharedPref = await SharedPreferences.getInstance();
        await sharedPref.setString('userId', userCredential.user!.uid);
        emit(AuthLoginSucsess());
      } else {
        print("in Auth Cubit  UID is Null");
      }
    } on FirebaseException catch (e) {
      emit(AuthLoginFaliure(errmessage: '${e.message}'));
    }
  }

  void signOut() async {
    await FirebaseAuth.instance.signOut();
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
    final userCredential = FirebaseAuth.instance;
    await userCredential.currentUser?.delete();
  }

  //
  Future<void> resetPassword({required String email}) async {
    try {
      if (email != "") {
        await auth.sendPasswordResetEmail(email: email.toString());
        print("Reset sucsess");
        // emit(ResetPasswordsucsess());
      }
    } on Exception catch (e) {
      print("Reset faliure${e.toString()}");
      //  emit(ResetPasswordFaliure(errmessage: e.toString()));
    }
  }
}
