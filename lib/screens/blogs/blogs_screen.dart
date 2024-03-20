import 'package:blog_app/components/custom_text/custom_poppingtext.dart';
import 'package:blog_app/providers/auth_provider.dart';
import 'package:blog_app/screens/blogs/widget/user_specific_blogs.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//see all the blogs the use have created

class BlogsScreen extends StatefulWidget {
  const BlogsScreen({super.key});

  @override
  State<BlogsScreen> createState() => _BlogsScreenState();
}

class _BlogsScreenState extends State<BlogsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(
      child: Consumer<AuthProviders>(builder: (context, value, child) {
        return const Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 30,
                ),
                CustomPoppingText(text: "Your Blogs")
              ],
            ),
            Divider(),
            UserSpecificBlogs()
          ],
        );
      }),
    ));
  }
}
