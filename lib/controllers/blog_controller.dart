import 'package:blog_app/models/blog_model.dart';
import 'package:blog_app/providers/auth_provider.dart';
import 'package:blog_app/providers/blog_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

class BlogPostController {
  CollectionReference blogs = FirebaseFirestore.instance.collection("Blogs");
  CollectionReference users = FirebaseFirestore.instance.collection("Users");

  Future<void> addBlogPost(BlogPostModel model, CollectionReference blogsPost,
      String docId, BuildContext context) async {
    await blogsPost.doc(docId).set(model.toJson()).then((value) {
      Logger().f("Product Added");
      Provider.of<BlogProvider>(context, listen: false).clearForm();
    });
  }

  Future<List<BlogPostModel>> fetchBlogs(context) async {
    QuerySnapshot snapshot = await blogs.get();
    if (snapshot.docs.isEmpty) {
      Logger().e("Cant Fetch Data !!!!");
      return [];
    } else {
      List<BlogPostModel> blogs = [];
      for (var element in snapshot.docs) {
        BlogPostModel blog =
            BlogPostModel.fromJson(element.data() as Map<String, dynamic>);
        blogs.add(blog);
      }
      Provider.of<AuthProviders>(context, listen: false)
          .filterBookmarkedItems(blogs);

      Provider.of<BlogProvider>(context, listen: false).setAllBlogs(blogs);
      return blogs;
    }
  }

  Future<void> updateUserBlogList(String uid, List<String> items) async {
    try {
      await users.doc(uid).update({"bloglist": items});
    } catch (e) {
      Logger().e(e);
    }
  }
}
