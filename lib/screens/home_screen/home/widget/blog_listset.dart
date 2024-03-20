import 'package:blog_app/controllers/blog_controller.dart';
import 'package:blog_app/models/blog_model.dart';
import 'package:blog_app/screens/home_screen/home/widget/home_blogpost_card.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class BlogListSet extends StatelessWidget {
  const BlogListSet({
    super.key,
  });

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
                  highlightColor: Colors.grey.shade300,
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

          return Column(
            children: List.generate(blogs.length, (index) {
              return HomeBlogPostCard(
                blogs: blogs,
                index: index,
              );
            }),
          );
        });
  }
}
