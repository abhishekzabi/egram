// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyAK7jQCFQQLq2Tanep8DhUK_Oj2JwaSC7w',
    appId: '1:900321327886:web:48e0b092b170f8202eb55f',
    messagingSenderId: '900321327886',
    projectId: 'egramam-e19e9',
    authDomain: 'egramam-e19e9.firebaseapp.com',
    storageBucket: 'egramam-e19e9.appspot.com',
    measurementId: 'G-KJ0HQ62ST4',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDqS8RfNwUNMJGIKdQxIU6upUb6vSChaLc',
    appId: '1:900321327886:android:b1e84d6d93b99e1c2eb55f',
    messagingSenderId: '900321327886',
    projectId: 'egramam-e19e9',
    storageBucket: 'egramam-e19e9.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAdecDdlGpDC45EoNS1N3tK5awWN3WOO5g',
    appId: '1:900321327886:ios:656e6fa651fc862d2eb55f',
    messagingSenderId: '900321327886',
    projectId: 'egramam-e19e9',
    storageBucket: 'egramam-e19e9.appspot.com',
    iosBundleId: 'com.example.busdhekho',
  );
}
