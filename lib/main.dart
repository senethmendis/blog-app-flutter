import 'package:blog_app/firebase_options.dart';
import 'package:blog_app/providers/blog_provider.dart';
import 'package:blog_app/providers/auth_provider.dart';
import 'package:blog_app/providers/main_screen_provider.dart';
import 'package:blog_app/providers/profile_provider.dart';
import 'package:blog_app/providers/signin_provider.dart';
import 'package:blog_app/providers/signup_provider.dart';
import 'package:blog_app/screens/splash_screen/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => SignUpProvider()),
      ChangeNotifierProvider(create: (context) => SignInProvider()),
      ChangeNotifierProvider(create: (context) => AuthProviders()),
      ChangeNotifierProvider(create: (context) => MainScreenProvider()),
      ChangeNotifierProvider(create: (context) => ProfileProvider()),
      ChangeNotifierProvider(create: (context) => BlogProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Blog App',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white)
            .copyWith(background: const Color(0xffedf2fb)),
      ),
      home: const SplashScreen(),
    );
  }
}
