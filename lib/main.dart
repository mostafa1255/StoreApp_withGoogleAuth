import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:store_app/Feuture/Catigory_Cubit/category_cubit.dart';
import 'package:store_app/Feuture/Product_Cubit/product_cubit.dart';
import 'package:store_app/Feuture/data/services/AllGategory.dart';
import 'package:store_app/Feuture/data/services/AllProduct.dart';
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductCubit(allProductservice())..AllProducts(),
        ),
        BlocProvider(
          create: (context) =>
              CategoryCubit(AllCategoryservice())..AllCategory(),
        )
      ],
      child: const GetMaterialApp(
          debugShowCheckedModeBanner: false,
          home:
              HomeScreen() //constant.userid == null ? RegisterScreen() : LoginScreen(),
          ),
    );
  }
}
