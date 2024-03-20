import 'package:blog_app/controllers/blog_controller.dart';
import 'package:blog_app/models/blog_model.dart';
import 'package:blog_app/providers/auth_provider.dart';
import 'package:blog_app/screens/blogs/widget/user_added_blogs.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class UserSpecificBlogs extends StatefulWidget {
  const UserSpecificBlogs({
    super.key,
  });

  @override
  State<UserSpecificBlogs> createState() => _UserSpecificBlogsState();
}

class _UserSpecificBlogsState extends State<UserSpecificBlogs> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: BlogPostController().fetchBlogs(context),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text("Has Error !!!!!");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 6,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return Shimmer.fromColors(
                  baseColor: Colors.grey.shade200,
                  highlightColor: Colors.grey.shade400,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 100,
                      color: Colors.grey,
                    ),
                  ),
                );
              },
            );
          }
          List<BlogPostModel> blogs = snapshot.data!;

          return Builder(builder: (context) {
            return Consumer<AuthProviders>(builder: (context, value, child) {
              return Column(
                children: List.generate(blogs.length, (index) {
                  Logger().i(blogs[index].userid);
                  return value.userModel!.uid == blogs[index].userid
                      ? UserAddedBlogs(
                          blogs: blogs,
                          index: index,
                        )
                      : const Text("");
                }),
              );
            });
          });
        });
  }
}
