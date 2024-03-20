import 'package:blog_app/components/custom_text/custom_poppingtext.dart';
import 'package:blog_app/providers/auth_provider.dart';
import 'package:blog_app/screens/home_screen/home/bookmarks/widgets/bookmarked_blogs.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookMarksScreen extends StatefulWidget {
  const BookMarksScreen({super.key});

  @override
  State<BookMarksScreen> createState() => _BookMarksScreenState();
}

class _BookMarksScreenState extends State<BookMarksScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Row(
            children: [
              BackButton(
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              const SizedBox(
                width: 30,
              ),
              const CustomPoppingText(text: "Bookmarks")
            ],
          ),
          const Divider(),
          Expanded(
            child: Consumer<AuthProviders>(builder: (context, value, child) {
              return value.bookmarkedItems.isNotEmpty
                  ? ListView.builder(
                      itemCount: value.bookmarkedItems.length,
                      itemBuilder: (context, index) {
                        return BookmarkedBlogs(
                          blogs: value.bookmarkedItems,
                          index: index,
                        );
                      },
                    )
                  : const Center(
                      child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                          image: NetworkImage(
                              "https://icons.veryicon.com/png/o/business/financial-category/no-data-6.png",
                              scale: 0.5),
                          width: 200,
                        ),
                        Text("No Bookmarks")
                      ],
                    ));
            }),
          )
        ],
      ),
    ));
  }
}
