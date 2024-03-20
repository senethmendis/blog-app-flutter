import 'package:blog_app/components/custom_buttons/custom_button_wthicon.dart';
import 'package:blog_app/components/custom_fileds/custom_textfiled.dart';
import 'package:blog_app/components/custom_text/custom_poppingtext.dart';
import 'package:blog_app/providers/auth_provider.dart';
import 'package:blog_app/providers/blog_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  CollectionReference blogs = FirebaseFirestore.instance.collection("Blogs");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "Dashboard",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: SafeArea(child: Consumer2<BlogProvider, AuthProviders>(
          builder: (context, value, auth, child) {
        return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomPoppingText(text: "Blog Cover Iamge"),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    value.pickImage(context);
                  },
                  child: Container(
                    width: 300,
                    height: 200,
                    decoration: value.coverImageFile != null
                        ? BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                                image: FileImage(value.coverImageFile!),
                                fit: BoxFit.cover))
                        : null,
                    child: value.coverImageFile == null
                        ? const CircleAvatar(
                            radius: 100,
                            child: Icon(
                              Icons.add,
                              size: 50,
                            ),
                          )
                        : null,
                  ),
                ),
                CustomPoppingText(text: auth.userModel!.name),
                const SizedBox(height: 20),
                CustomTextFiled(
                  controller: value.blogNameController,
                  lable: "Blog Title",
                ),
                const SizedBox(height: 10),
                const SizedBox(height: 10),
                CustomTextFiled(
                  controller: value.categoryController,
                  lable: "Category",
                ),
                const SizedBox(height: 10),
                CustomTextFiled(
                  controller: value.descriptionController,
                  lable: "Description",
                ),
                const SizedBox(height: 10),
                CustomButtonWithIcon(
                  text: "Add Product",
                  width: MediaQuery.sizeOf(context).width,
                  color: Colors.black,
                  height: 60,
                  onTap: () {
                    value.addBlogPost(
                        context, auth.userModel!.uid, auth.userModel!.name);
                  },
                )
              ],
            ),
          ),
        );
      })),
    );
  }
}
