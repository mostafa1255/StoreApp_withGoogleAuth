import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:store_app/Feuture/Cart_Product_Cubit/cart_product_cubit.dart';
import 'package:store_app/Feuture/Catigory_Cubit/category_cubit.dart';
import 'package:store_app/Feuture/Product_Cubit/product_cubit.dart';
import 'package:store_app/Feuture/data/services/AllGategory.dart';
import 'package:store_app/Feuture/data/services/AllProduct.dart';
import 'package:store_app/core/constant.dart';
import 'firebase_options.dart';

Future<void> firebaseMessaging(RemoteMessage remoteMessage) async {
  if (kDebugMode) {
    print(remoteMessage.messageId);
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final sharedPref = await SharedPreferences.getInstance();
  constant.userid = sharedPref.getString('userId');
  print(constant.userid);
  FirebaseMessaging.onBackgroundMessage(firebaseMessaging);

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
        ),
        BlocProvider(
          create: (context) => CartProductCubit(),
        )
      ],
      child: const GetMaterialApp(
          debugShowCheckedModeBanner: false,
          home:
              FirebaseMessage() //constant.userid == null ? RegisterScreen() : LoginScreen(),
          ),
    );
  }
}

class FirebaseMessage extends StatefulWidget {
  const FirebaseMessage({super.key});

  @override
  State<FirebaseMessage> createState() => _FirebaseMessageState();
}

class _FirebaseMessageState extends State<FirebaseMessage> {
  void requestPermision() async {
    FirebaseMessaging message = FirebaseMessaging.instance;
    NotificationSettings settings = await message.requestPermission(
        alert: true,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        sound: true,
        provisional: false,
        announcement: false);
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print("User Authrized");
    }
    try {
      FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
        print(
            "Messsage is ${message.notification?.title} and body is ${message.notification?.body}");
      });
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    requestPermision();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Firebase Messsaging"),
      ),
    );
  }
}
