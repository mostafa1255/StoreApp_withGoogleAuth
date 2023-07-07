// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyA6AEdB6hDEYbHXBEm7jyZ5Ct9vt2mJyPk',
    appId: '1:606963147186:web:9d87f229397ae6dbcd84ab',
    messagingSenderId: '606963147186',
    projectId: 'store-app-936ef',
    authDomain: 'store-app-936ef.firebaseapp.com',
    storageBucket: 'store-app-936ef.appspot.com',
    measurementId: 'G-L8H355VFD8',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD9uHFIIlSv8fwDcQvdIr4eH0pLJVv4aCs',
    appId: '1:606963147186:android:21405797ce0b9052cd84ab',
    messagingSenderId: '606963147186',
    projectId: 'store-app-936ef',
    storageBucket: 'store-app-936ef.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyClz3TW_d8elzxNzCqWjFTb4hUkKHcAYUA',
    appId: '1:606963147186:ios:753334daf10ed2e2cd84ab',
    messagingSenderId: '606963147186',
    projectId: 'store-app-936ef',
    storageBucket: 'store-app-936ef.appspot.com',
    iosClientId: '606963147186-q4tb58svuadkk8dahi88a58hpetqss8e.apps.googleusercontent.com',
    iosBundleId: 'com.example.storeApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyClz3TW_d8elzxNzCqWjFTb4hUkKHcAYUA',
    appId: '1:606963147186:ios:78a6acaa53f6e1d7cd84ab',
    messagingSenderId: '606963147186',
    projectId: 'store-app-936ef',
    storageBucket: 'store-app-936ef.appspot.com',
    iosClientId: '606963147186-odl2qpbc19pf5g4b2el1sq8br51g9u83.apps.googleusercontent.com',
    iosBundleId: 'com.example.storeApp.RunnerTests',
  );
}