import 'package:blog_app/screens/blogs/blogs_screen.dart';
import 'package:blog_app/screens/home_screen/home/bookmarks/bookmark.dart';
import 'package:blog_app/screens/home_screen/home/home_screen.dart';
import 'package:blog_app/screens/home_screen/home/profile_screen/user_profile_screen.dart';
import 'package:flutter/material.dart';

class MainScreenProvider extends ChangeNotifier {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  final List<Widget> _screens = [
    const HomeScreen(),
    const BookMarksScreen(),
    const BlogsScreen(),
    const UserProfileScreen(),
  ];

  Widget get screen => _screens[_currentIndex];

  void setIndex(index) {
    _currentIndex = index;
    notifyListeners();
  }
}
