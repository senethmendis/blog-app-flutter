import 'package:blog_app/components/custom_text/custom_poppingtext.dart';
import 'package:blog_app/models/blog_model.dart';
import 'package:blog_app/screens/home_screen/home/widget/custom_icon_button.dart';
import 'package:flutter/material.dart';

class BlogDetailPage extends StatefulWidget {
  const BlogDetailPage({
    super.key,
    required this.model,
  });

  final BlogPostModel model;

  @override
  State<BlogDetailPage> createState() => _BlogDetailPageState();
}

class _BlogDetailPageState extends State<BlogDetailPage> {
  bool toggle = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              width: MediaQuery.sizeOf(context).width,
              height: 300,
              decoration: BoxDecoration(
                  color: Colors.amber,
                  image: DecorationImage(
                      image: NetworkImage(widget.model.coverImage),
                      fit: BoxFit.cover)),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomIconButton(
                        icon: Icons.arrow_back_ios_new,
                        color: Colors.black,
                        iconColor: Colors.white,
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(7)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 4),
                      child: CustomPoppingText(
                        text: widget.model.category.toUpperCase(),
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  CustomPoppingText(text: widget.model.title),
                  const SizedBox(height: 20),
                  Container(
                    width: MediaQuery.sizeOf(context).width,
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(color: Colors.grey.shade400))),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 25,
                              backgroundImage:
                                  NetworkImage(widget.model.coverImage),
                            ),
                            const SizedBox(width: 10),
                            CustomPoppingText(text: widget.model.author),
                            const Spacer(),
                            InkWell(
                                onTap: () {},
                                child: const Icon(
                                  Icons.bookmark_border_outlined,
                                  size: 40,
                                ))
                          ],
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  CustomPoppingText(
                    text: widget.model.title,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    widget.model.description,
                    textAlign: TextAlign.justify,
                    style: const TextStyle(fontSize: 18),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
