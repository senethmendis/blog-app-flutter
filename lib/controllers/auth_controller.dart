import 'package:blog_app/models/user_model.dart';
import 'package:blog_app/providers/auth_provider.dart';
import 'package:blog_app/screens/auth_screen/signin_screen.dart';
import 'package:blog_app/screens/home_screen/main_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

import '../utils/custom_navigator.dart';

class AuthController {
  CollectionReference users = FirebaseFirestore.instance.collection("Users");

  Future<void> listenAuthState(BuildContext context) async {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        Logger().f('User is currently signed out!');
        CustomNavigator.goto(context, const SignInPage());
      } else {
        Provider.of<AuthProviders>(context, listen: false).setUser(user);
        Logger().f('User is signed in!');
        fetchUserData(user.uid).then((value) {
          if (value != null) {
            Provider.of<AuthProviders>(context, listen: false)
                .setUserModel(value, context, value.name);
            CustomNavigator.goto(context, const MainScreen());
          } else {
            Provider.of<AuthProviders>(context, listen: false).setUserModel(
                UserModel(
                  name: "",
                  email: user.email!,
                  image:
                      "https://imgv3.fotor.com/images/blog-richtext-image/10-profile-picture-ideas-to-make-you-stand-out.jpg",
                  uid: user.uid,
                  bookmark: [],
                  bloglist: [],
                ),
                context,
                "");
            CustomNavigator.goto(context, const MainScreen());
          }
        });
        //Logger().f(user);
      }
    });
  }

  Future<bool> createAccount({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (credential.user != null) {
        UserModel model = UserModel(
          name: name,
          email: email,
          image:
              "https://imgv3.fotor.com/images/blog-richtext-image/10-profile-picture-ideas-to-make-you-stand-out.jpg",
          uid: credential.user!.uid,
          bookmark: [],
          bloglist: [],
        );
        addUserData(model);
      }
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Logger().w('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        Logger().w('The account already exists for that email.');
      }
      return false;
    } catch (e) {
      Logger().e(e);
      return false;
    }
  }

  Future<void> signOutUser() async {
    await FirebaseAuth.instance.signOut();
  }

  Future<void> signInWithPassword(
      {required String email, required String password}) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Logger().f('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        Logger().f('Wrong password provided for that user.');
      }
    }
  }

  Future<void> sendPasswordResetEmail(String email) async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }

  Future<void> addUserData(UserModel user) async {
    try {
      await users.doc(user.uid).set(user.toJson());
      Logger().f("User Data Added!");
    } catch (e) {
      Logger().e(e);
    }
  }

  Future<UserModel?> fetchUserData(String uid) async {
    DocumentSnapshot snapshot = await users.doc(uid).get();
    try {
      return UserModel.fromJson(snapshot.data() as Map<String, dynamic>);
    } catch (e) {
      Logger().e(e);
      return null;
    }
  }

  Future<void> updateUser(Map<String, dynamic> data, String uid) async {
    try {
      await users.doc(uid).update(data);
      Logger().f("User Updated");
    } catch (e) {
      Logger().e(e);
    }
  }

  Future<void> updateBookmark(String uid, List<String> items) async {
    try {
      await users.doc(uid).update({"bookmark": items});
    } catch (e) {
      Logger().e(e);
    }
  }
}
