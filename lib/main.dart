import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:store_app/Feuture/Auth/views/Login_Screen.dart';
import 'package:store_app/Feuture/Cart_Product_Cubit/cart_product_cubit.dart';
import 'package:store_app/Feuture/Catigory_Cubit/category_cubit.dart';
import 'package:store_app/Feuture/Product_Cubit/product_cubit.dart';
import 'package:store_app/Feuture/data/services/AllGategory.dart';
import 'package:store_app/Feuture/data/services/AllProduct.dart';
import 'package:store_app/Feuture/views/Home/views/home_screen.dart';
import 'package:store_app/Feuture/views/Item_Info/views/Item_Info_Screen.dart';
import 'package:store_app/core/constant.dart';
import 'Feuture/Auth/views/Register_Screen.dart';
import 'firebase_options.dart';
import 'package:http/http.dart' as http;

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
      child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          home:
              LoginScreen() //constant.userid == null ? RegisterScreen() : HomeScreen(),
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

  String serverToken =
      'AAAAjVHSobI:APA91bHmml2PUCMLCQFkLQn5mR9KcXSHjlWXBYhBchwokE5_dTZoZc1beMVhG3zZbNoguhKhzTFFmiFPircGkSxNXOAEItadu57Z05oUSJugVVKzIDFd8WzBkBLl6WXRnFluI5wWUkQr';
  sendNotify(
      {required String title, required String body, required String id}) async {
    await http.post(
      Uri.parse('https://fcm.googleapis.com/fcm/send'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'key=$serverToken',
      },
      body: jsonEncode(
        <String, dynamic>{
          'notification': <String, dynamic>{
            'body': body,
            'title': title,
          },
          'priority': 'high',
          'data': <String, dynamic>{
            'click_action': 'FLUTTER_NOTIFICATION_CLICK',
            'id': id,
            'status': 'done'
          },
          'to': await FirebaseMessaging.instance.getToken(),
        },
      ),
    );
  }

  initialMessage() async {
    var message = await FirebaseMessaging.instance.getInitialMessage();
    if (message != null) {
      Get.to(ItemInfoScreen(index: 0));
    }
  }

  @override
  void initState() {
    super.initState();
//when i click notification but app is terminated
    initialMessage();
    requestPermision();
    //when i click on notification but app in the background not terminated
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      Get.to(() => const HomeScreen());
    });
    //
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Firebase Messsaging"),
      ),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () async {
                await FirebaseMessaging.instance.getToken().then((token) {
                  print(token);
                });
              },
              child: const Text("Get token")),
          ElevatedButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
              },
              child: const Text("Sign Out")),
          ElevatedButton(
              onPressed: () {
                sendNotify(title: "mostafa", body: "test notify", id: "1");
              },
              child: Text("Send Notify"))
        ],
      ),
    );
  }
}
