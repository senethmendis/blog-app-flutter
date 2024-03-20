import 'package:blog_app/components/custom_text/custom_poppingtext.dart';
import 'package:blog_app/models/blog_model.dart';
import 'package:blog_app/providers/auth_provider.dart';
import 'package:blog_app/screens/blog_details_screen/blog_detail_screen.dart';
import 'package:blog_app/utils/custom_navigator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeBlogPostCard extends StatelessWidget {
  const HomeBlogPostCard({
    super.key,
    required this.blogs,
    required this.index,
  });

  final List<BlogPostModel> blogs;
  final dynamic index;

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProviders>(builder: (context, value, child) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Container(
          height: 200,
          decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey.shade300))),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(7)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 4),
                            child: CustomPoppingText(
                              text: blogs[index].category.toUpperCase(),
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: GestureDetector(
                              onTap: () {
                                if (value.bookmarkId
                                    .contains(blogs[index].id)) {
                                  value.removeFromBookmark(blogs[index]);
                                } else {
                                  value.addToBookmark(blogs[index]);
                                }
                              },
                              child: Icon(
                                  color:
                                      value.bookmarkId.contains(blogs[index].id)
                                          ? Colors.red
                                          : Colors.grey,
                                  value.bookmarkId.contains(blogs[index].id)
                                      ? Icons.bookmark
                                      : Icons.bookmark_add_outlined)),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 240,
                      height: 80,
                      decoration: const BoxDecoration(),
                      child: Text(
                        blogs[index].title,
                        softWrap: true,
                        style: const TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 18),
                      ),
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 15,
                          backgroundColor: Colors.amber,
                          backgroundImage:
                              NetworkImage(blogs[index].coverImage),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          blogs[index].author,
                          // widget.author.length > 23
                          //     ? widget.author.substring(0, 23)
                          //     : widget.author,
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey.shade600),
                        ),
                      ],
                    )
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    CustomNavigator.goto(
                        context,
                        BlogDetailPage(
                          model: blogs[index],
                        ));
                  },
                  child: Container(
                    width: 110,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(blogs[index].coverImage),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(15)),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
