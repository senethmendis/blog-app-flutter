import 'package:blog_app/components/custom_text/custom_poppingtext.dart';
import 'package:blog_app/controllers/auth_controller.dart';
import 'package:blog_app/screens/home_screen/home/widget/user_detail_card.dart';
import 'package:blog_app/utils/custom_navigator.dart';
import 'package:flutter/material.dart';

import '../profile_screen/user_profile_screen.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black,
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 255, 255, 255),
            ),
            child: UserDetailCard(
              onTap: () {
                CustomNavigator.goto(context, const UserProfileScreen());
              },
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.person,
              color: Colors.white,
            ),
            title: const CustomPoppingText(
              text: "Profile",
              color: Colors.white,
            ),
            onTap: () {
              CustomNavigator.goto(context, const UserProfileScreen());
            },
          ),
          ListTile(
            title: const CustomPoppingText(
              text: "Item 2",
              color: Colors.white,
            ),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            leading: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: InkWell(
                onTap: () {
                  AuthController().signOutUser();
                },
                child: const CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(Icons.output_sharp),
                ),
              ),
            ),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
        ],
      ),
    );
  }
}
