import 'package:blog_app/components/custom_text/custom_poppingtext.dart';
import 'package:blog_app/screens/home_screen/home/widget/blog_listset.dart';
import 'package:blog_app/screens/home_screen/home/widget/main_category_slider.dart';
import 'package:blog_app/utils/demodata.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'widget/custom_actionbar.dart';
import 'widget/custom_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map> sliderData = DemoData.sliberImages;

//padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: const CupertinoIconThemeData(
          color: Colors.white,
          size: 35,
        ),
        centerTitle: true,
        title: const CustomPoppingText(
          text: "Blogger.",
          fontWeight: FontWeight.bold,
          fontSize: 28,
          color: Colors.pink,
        ),
        toolbarHeight: 80,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            CustomActionBar(
              onTap: () {},
            ),
            Column(
              children: [
                const SizedBox(height: 20),
                CategorySlider(sliderData: sliderData),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Column(
                children: [
                  const SizedBox(height: 30),
                  Container(
                    width: MediaQuery.sizeOf(context).width,
                    height: 1,
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(color: Colors.grey.shade400))),
                  ),
                  const SizedBox(height: 20),
                  const BlogListSet()
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
