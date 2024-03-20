import 'package:blog_app/components/custom_buttons/custom_button_wthicon.dart';
import 'package:blog_app/components/custom_fileds/custom_textfiled.dart';
import 'package:blog_app/providers/auth_provider.dart';
import 'package:blog_app/providers/profile_provider.dart';
import 'package:blog_app/screens/home_screen/admin/addblog_screen.dart';
import 'package:blog_app/utils/custom_navigator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer2<AuthProviders, ProfileProvider>(
          builder: (context, auth, profile, child) {
        return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Container(
                width: MediaQuery.sizeOf(context).width,
                height: 450,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30)),
                    image: DecorationImage(
                        //https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/62b6229b-86d7-48df-964e-dea5b170ed31/dd4nsx5-c7c9ca0d-edfa-46d9-a6a7-a30c449953a2.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcLzYyYjYyMjliLTg2ZDctNDhkZi05NjRlLWRlYTViMTcwZWQzMVwvZGQ0bnN4NS1jN2M5Y2EwZC1lZGZhLTQ2ZDktYTZhNy1hMzBjNDQ5OTUzYTIucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.Z_z_LfBT4Hp15OtN7WnhZ8rZ0NLO0YN8JNZ1mf_wpOw
                        image: profile.pickedImage == null
                            ? NetworkImage("${auth.userModel?.image}")
                            : FileImage(profile.pickedImage!) as ImageProvider,
                        fit: BoxFit.cover)),
                child: Container(
                  width: MediaQuery.sizeOf(context).width,
                  height: 450,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30)),
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.blue.withOpacity(0),
                          Colors.purple.withOpacity(0.8),
                        ],
                      )),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Stack(children: [
                      Positioned(
                          bottom: 30,
                          child: InkWell(
                            onTap: () {
                              profile.pickProfileImage(context);
                            },
                            child: CircleAvatar(
                                backgroundColor: Colors.white.withOpacity(0.6),
                                child: const Icon(Icons.edit)),
                          )),
                    ]),
                  ),
                ),
              ),
              //end of the cover photo
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    CustomTextFiled(
                      controller: profile.nameController,
                      lable: "User Name",
                    ),
                    const SizedBox(height: 20),
                    CustomButtonWithIcon(
                      height: 60,
                      width: MediaQuery.sizeOf(context).width,
                      text: "Update",
                      color: Colors.black,
                      onTap: () {
                        profile.updateUserData(context);
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          CustomNavigator.goto(context, const AdminScreen());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
