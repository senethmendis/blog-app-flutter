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
    apiKey: 'AIzaSyCC7D1w-HDEDm10XXapifm47BpnxVTLsj0',
    appId: '1:39920133955:web:466d6fa75d1dca5d1071f6',
    messagingSenderId: '39920133955',
    projectId: 'blog-new-app',
    authDomain: 'blog-new-app.firebaseapp.com',
    storageBucket: 'blog-new-app.appspot.com',
    measurementId: 'G-HKTRWWR3RP',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBI2Kgsa2E25pQH4stWL0YhB-FM1vuBw3g',
    appId: '1:39920133955:android:0bfd15e85ff646f41071f6',
    messagingSenderId: '39920133955',
    projectId: 'blog-new-app',
    storageBucket: 'blog-new-app.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAa0sGyZsFPnvcI5x1Bs0Ev8s4SrQyj-Vg',
    appId: '1:39920133955:ios:97b3f2ebbd08f4a11071f6',
    messagingSenderId: '39920133955',
    projectId: 'blog-new-app',
    storageBucket: 'blog-new-app.appspot.com',
    iosBundleId: 'lk.smk.bloggerApp',
  );
}
