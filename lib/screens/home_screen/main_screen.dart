import 'package:blog_app/providers/blog_provider.dart';
import 'package:blog_app/providers/auth_provider.dart';
import 'package:blog_app/providers/main_screen_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer3<MainScreenProvider, AuthProviders, BlogProvider>(
        builder: (context, value, auth, admin, child) {
      return Scaffold(
        body: value.screen,
        bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.black,
            type: BottomNavigationBarType.fixed,
            currentIndex: value.currentIndex,
            onTap: (index) {
              value.setIndex(index);
              //Logger().t(index);
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_outlined,
                  color: Colors.white,
                ),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.bookmark_border,
                  color: Colors.white,
                ),
                label: "Bookmarks",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.chrome_reader_mode_outlined,
                  color: Colors.white,
                ),
                label: "Blogs",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.person_2_outlined,
                  color: Colors.white,
                ),
                label: "Profile",
              ),
            ]),
      );
    });
  }
}
