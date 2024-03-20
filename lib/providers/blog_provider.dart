import 'dart:io';

import 'package:blog_app/controllers/blog_controller.dart';
import 'package:blog_app/controllers/storage_controller.dart';
import 'package:blog_app/models/blog_model.dart';
import 'package:blog_app/utils/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class BlogProvider extends ChangeNotifier {
  BlogPostController blogPostController = BlogPostController();

  final TextEditingController _blogNameController = TextEditingController();
  TextEditingController get blogNameController => _blogNameController;

  final TextEditingController _descriptionController = TextEditingController();
  TextEditingController get descriptionController => _descriptionController;

  final TextEditingController _categoryController = TextEditingController();
  TextEditingController get categoryController => _categoryController;

  File? _coverImageFile;
  File? get coverImageFile => _coverImageFile;

  List<BlogPostModel> _allItems = [];
  List<BlogPostModel> get allItems => _allItems;

  final List<String> _publishblogId = [];
  List<String> get publishblogId => _publishblogId;

  final List<BlogPostModel> _publishblogItems = [];
  List<BlogPostModel> get publishblogItems => _publishblogItems;

  User? _user;
  User? get user => _user;

  CollectionReference blogsPost =
      FirebaseFirestore.instance.collection("Blogs");

  Future<void> pickImage(BuildContext context) async {
    _coverImageFile = await FileImagePicker().pickImage(context);
    notifyListeners();
  }

  Future<void> addBlogPost(
      BuildContext context, String uid, String userName) async {
    if (_coverImageFile != null &&
        _blogNameController.text.trim().isNotEmpty &&
        _descriptionController.text.trim().isNotEmpty &&
        _categoryController.text.trim().isNotEmpty) {
      String docId = blogsPost.doc().id;
      await StorageController()
          .uploadImage("Blog Cover Image", "$docId.jpg", _coverImageFile!)
          .then((value) async {
        if (value == "") {
          Logger().f("Faild!!!!");
        } else {
          BlogPostModel model = BlogPostModel(
            id: docId,
            title: _blogNameController.text,
            author: userName,
            category: _categoryController.text,
            description: _descriptionController.text,
            coverImage: value,
            userid: uid,
          );
          await blogPostController.addBlogPost(
              model, blogsPost, docId, context);
        }
      });
    } else {
      Logger().e("Pleasse Enter Blog Details !!!");
    }
  }

  void publishBlog(BlogPostModel model) {
    _publishblogId.add(model.id);
    _publishblogItems.add(model);
    blogPostController.updateUserBlogList(user!.uid, _publishblogId);
    notifyListeners();
  }

  void clearForm() {
    _descriptionController.clear();
    _blogNameController.clear();
    _categoryController.clear();
    _coverImageFile = null;
    notifyListeners();
  }

  void setAllBlogs(List<BlogPostModel> list) {
    _allItems = list;
    notifyListeners();
  }
}
