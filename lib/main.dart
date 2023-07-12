import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:store_app/Feuture/views/Cart/cart_screen.dart';
import 'package:store_app/Feuture/views/Home/views/home_screen.dart';

import 'package:store_app/Feuture/views/Item_Info/views/Item_Info_Screen.dart';
import 'package:store_app/core/constant.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final sharedPref = await SharedPreferences.getInstance();
  constant.userid = sharedPref.getString('userId');
  print(constant.userid);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home:
            CartScreen() //constant.userid == null ? RegisterScreen() : LoginScreen(),
        );
  }
}
