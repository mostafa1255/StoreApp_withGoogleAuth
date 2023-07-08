import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:store_app/Feuture/Auth/cubit/auth_cubit.dart';
import 'package:store_app/Feuture/Auth/views/Login_Screen.dart';
import 'package:store_app/Feuture/Auth/views/widgets/CustomAuthGoogleFacebook.dart';
import 'package:store_app/Feuture/Auth/views/widgets/CustomTextFormField.dart';
import 'package:store_app/Feuture/Auth/views/widgets/CustomnavigateAuth.dart';
import 'package:store_app/core/App_Color.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var device = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthSignSucsess) {
            Get.showSnackbar(const GetSnackBar(
              title: "Sucsess",
              message: "Create Email Sucsessfull",
              duration: Duration(seconds: 3),
              backgroundColor: Colors.green,
              icon: Icon(Icons.check, color: Colors.white),
            ));
            Get.to(LoginScreen());

            ///
          } else if (state is googleSignSucsess) {
            Get.showSnackbar(const GetSnackBar(
              title: "Sucsess",
              message: "Create Email Sucsessfull",
              duration: Duration(seconds: 3),
              backgroundColor: Colors.green,
              icon: Icon(Icons.check, color: Colors.white),
            ));
            Get.to(LoginScreen());
          } else if (state is googleSignFaliure) {
            Get.showSnackbar(GetSnackBar(
              title: "Faliure",
              message: state.errmessage,
              duration: const Duration(seconds: 3),
              backgroundColor: Colors.red,
              icon: const Icon(Icons.check, color: Colors.white),
            ));
          } else if (state is AuthSignFaliure) {
            Get.showSnackbar(GetSnackBar(
              title: "Faliure",
              message: state.errmessage,
              duration: const Duration(seconds: 3),
              backgroundColor: Colors.red,
              icon: const Icon(Icons.close, color: Colors.white),
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
                          children: [
                            SizedBox(
                              height: device.height * 0.1,
                            ),
                            const Text(
                              "Sign Up",
                              style: TextStyle(
                                  fontSize: 60,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: device.height * 0.2,
                            ),
                            CustomTextFormField(
                                stringController: emailController,
                                device: device,
                                hinttext: "Email",
                                SecurPass: false),
                            CustomTextFormField(
                                stringController: passwordController,
                                device: device,
                                hinttext: "Paswword",
                                SecurPass: true),
                            GestureDetector(
                              onTap: () {
                                print("Clicked");
                                authcubit.Register(
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
                                facebookonPressed: () async {
                                  await authcubit.signInWithFacebook();
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
                              screen: "Login",
                              text: "do you have an account",
                              onTap: () {
                                Get.to(LoginScreen());
                              },
                            )
                          ],
                        ),
                      )),
          );
        },
      ),
    );
  }
}
