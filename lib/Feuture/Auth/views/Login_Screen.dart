import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:store_app/Feuture/Auth/cubit/auth_cubit.dart';
import 'package:store_app/Feuture/Auth/views/Register_Screen.dart';
import 'package:store_app/Feuture/Auth/views/widgets/CustomAuthGoogleFacebook.dart';
import 'package:store_app/Feuture/Auth/views/widgets/CustomTextFormField.dart';
import 'package:store_app/Feuture/Auth/views/widgets/CustomnavigateAuth.dart';
import 'package:store_app/Feuture/views/Home/views/home_screen.dart';
import 'package:store_app/core/App_Color.dart';
import 'package:store_app/main.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance;
    var device = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthLoginSucsess && user.currentUser!.emailVerified ||
              user.currentUser?.uid != null) {
            Get.showSnackbar(const GetSnackBar(
              title: "Sucsess",
              message: "Loigin Sucsessfull",
              duration: Duration(seconds: 3),
              backgroundColor: Colors.green,
              icon: Icon(Icons.check, color: Colors.white),
            ));
            Get.to(const FirebaseMessage());
          } else if (state is AuthLoginSucsess &&
              user.currentUser!.emailVerified == false) {
            Get.showSnackbar(const GetSnackBar(
              title: "Faliure",
              message:
                  "Please Click Your Link in your Email to Verify Your Account",
              duration: Duration(seconds: 3),
              backgroundColor: Colors.red,
              icon: Icon(Icons.close, color: Colors.white),
            ));
            user.currentUser!.sendEmailVerification();
          } else if (state is AuthLoginFaliure) {
            Get.showSnackbar(GetSnackBar(
              title: "Faliure",
              message: state.errmessage,
              duration: const Duration(seconds: 3),
              backgroundColor: Colors.red,
              icon: const Icon(Icons.close, color: Colors.white),
            ));
          } else if (state is googleSignSucsess) {
            Get.showSnackbar(const GetSnackBar(
              title: "Sucsess",
              message: "Login Email Sucsessfull",
              duration: Duration(seconds: 3),
              backgroundColor: Colors.green,
              icon: Icon(Icons.check, color: Colors.white),
            ));
            Get.to(const HomeScreen());
          } else if (state is googleSignFaliure) {
            Get.showSnackbar(GetSnackBar(
              title: "Faliure",
              message: state.errmessage,
              duration: const Duration(seconds: 3),
              backgroundColor: Colors.red,
              icon: const Icon(Icons.check, color: Colors.white),
            ));
          }
        },
        builder: (context, state) {
          var authcubit = BlocProvider.of<AuthCubit>(context);
          return Scaffold(
            backgroundColor: const Color(appcolor.KprimaryColor),
            body: Center(
              child: state is LoadingSate
                  ? const SpinKitWave(
                      color: Colors.blue,
                      size: 50.0,
                    )
                  : SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.lock,
                            color: Colors.white,
                            size: 120,
                          ),
                          SizedBox(
                            height: device.height * 0.1,
                          ),
                          CustomTextFormField(
                              stringController: emailController,
                              device: device,
                              hinttext: 'Email',
                              SecurPass: false),
                          CustomTextFormField(
                              stringController: passwordController,
                              device: device,
                              hinttext: 'Password',
                              SecurPass: true),
                          Row(
                            children: [
                              SizedBox(
                                width: device.width * 0.6,
                              ),
                              GestureDetector(
                                onTap: () {
                                  authcubit.resetPassword(
                                      email: emailController.text);
                                },
                                child: Container(
                                  child: const Text(
                                    "Forgot Password?",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey),
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: device.height * 0.015,
                          ),
                          GestureDetector(
                            onTap: () {
                              authcubit.Login(
                                  email: emailController.text,
                                  password: passwordController.text);
                            },
                            child: Container(
                              height: device.height * 0.07,
                              width: device.width * 0.9,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.blue),
                              child: const Center(
                                  child: Text(
                                "login",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.8),
                              )),
                            ),
                          ),
                          SizedBox(
                            height: device.height * 0.03,
                          ),
                          CustomAuthGoogleFacebook(
                              facebookonPressed: () {
                                authcubit.deleteAccount();
                                //authcubit.signOut();
                              },
                              googleonPressed: () async {
                                await authcubit.signInWithGoogle();
                              },
                              device: device,
                              authcubit: authcubit),
                          SizedBox(
                            height: device.height * 0.05,
                          ),
                          CustomnavigateAuth(
                            device: device,
                            text: "do you have not an account",
                            screen: "Sign up",
                            onTap: () => Get.to(RegisterScreen()),
                          )
                        ],
                      ),
                    ),
            ),
          );
        },
      ),
    );
  }
}
