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
    apiKey: 'AIzaSyDrilgeZhsu5z02Jmw_YPB83RwaJgheKMU',
    appId: '1:225493962220:web:856e2b0fadcd8ca5f204c9',
    messagingSenderId: '225493962220',
    projectId: 'food-app-ae49d',
    authDomain: 'food-app-ae49d.firebaseapp.com',
    storageBucket: 'food-app-ae49d.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBmyHmWCARsMn25e52rrURvj_zzT3-9Bqo',
    appId: '1:225493962220:android:5af093e82535b076f204c9',
    messagingSenderId: '225493962220',
    projectId: 'food-app-ae49d',
    storageBucket: 'food-app-ae49d.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDzT1ey--Ra8UYWFbN9QpMON5stPCaFWpI',
    appId: '1:225493962220:ios:57310ed329d9e61df204c9',
    messagingSenderId: '225493962220',
    projectId: 'food-app-ae49d',
    storageBucket: 'food-app-ae49d.appspot.com',
    iosClientId: '225493962220-kuoe6t10bb3dtt0umdgali9gt5cdcocu.apps.googleusercontent.com',
    iosBundleId: 'com.example.foodApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDzT1ey--Ra8UYWFbN9QpMON5stPCaFWpI',
    appId: '1:225493962220:ios:57310ed329d9e61df204c9',
    messagingSenderId: '225493962220',
    projectId: 'food-app-ae49d',
    storageBucket: 'food-app-ae49d.appspot.com',
    iosClientId: '225493962220-kuoe6t10bb3dtt0umdgali9gt5cdcocu.apps.googleusercontent.com',
    iosBundleId: 'com.example.foodApp',
  );
}
