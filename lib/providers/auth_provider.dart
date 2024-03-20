import 'package:blog_app/controllers/auth_controller.dart';
import 'package:blog_app/models/blog_model.dart';
import 'package:blog_app/models/user_model.dart';
import 'package:blog_app/providers/profile_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthProviders extends ChangeNotifier {
  User? _user;
  User? get user => _user;

  UserModel? _userModel;
  UserModel? get userModel => _userModel;

  List<String> _bookmarkId = [];
  List<String> get bookmarkId => _bookmarkId;

  List<BlogPostModel> _bookmarkedItems = [];
  List<BlogPostModel> get bookmarkedItems => _bookmarkedItems;

  AuthController authController = AuthController();

  void setUser(User user) {
    _user = user;
    notifyListeners();
  }

  void setUserModel(UserModel model, BuildContext context, String name) {
    _userModel = model;
    _bookmarkId = model.bookmark;
    Provider.of<ProfileProvider>(context, listen: false).setUserName(name);
    notifyListeners();
  }

  void updateImage(String url) {
    _userModel!.image = url;
    notifyListeners();
  }

  void addToBookmark(BlogPostModel model) {
    _bookmarkId.add(model.id);
    _bookmarkedItems.add(model);
    authController.updateBookmark(user!.uid, _bookmarkId);
    notifyListeners();
  }

  void removeFromBookmark(BlogPostModel model) {
    _bookmarkId.remove(model.id);
    _bookmarkedItems.remove(model);
    authController.updateBookmark(user!.uid, _bookmarkId);
    notifyListeners();
  }

  void filterBookmarkedItems(List<BlogPostModel> blogs) {
    List<BlogPostModel> bookmarkedBlogs = [];
    for (var item in blogs) {
      if (_bookmarkId.contains(item.id) && !_bookmarkedItems.contains(item)) {
        bookmarkedBlogs.add(item);
      }
    }
    _bookmarkedItems = bookmarkedBlogs;
    notifyListeners();
  }
}
