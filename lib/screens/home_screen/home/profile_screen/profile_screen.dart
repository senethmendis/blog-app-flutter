import 'package:blog_app/components/custom_buttons/custom_button_wthicon.dart';
import 'package:blog_app/components/custom_fileds/custom_textfiled.dart';
import 'package:blog_app/providers/auth_provider.dart';
import 'package:blog_app/providers/profile_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer2<AuthProviders, ProfileProvider>(
          builder: (context, auth, profile, child) {
        return Column(
          children: [
           
            SizedBox(
              height: 200,
              child: Stack(
                children: [
                  Container(
                    height: 150,
                    decoration: const BoxDecoration(
                        color: Colors.grey,
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                "https://www.trendycovers.com/covers/1323357144.jpg"))),
                  ),
                  GestureDetector(
                    onTap: () {
                      profile.pickProfileImage(context);
                    },
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: profile.pickedImage == null
                            ? NetworkImage(auth.userModel!.image)
                            : FileImage(profile.pickedImage!) as ImageProvider,
                        child: Stack(
                          children: [
                            Positioned(
                              bottom: 6,
                              right: 6,
                              child: CircleAvatar(
                                radius: 12,
                                backgroundColor: Colors.black.withOpacity(0.5),
                                child: const Icon(
                                  Icons.edit,
                                  size: 15,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  CustomTextFiled(
                    controller: profile.nameController,
                    lable: "User Name",
                  ),
                  const SizedBox(height: 20),
                  CustomButtonWithIcon(
                    width: MediaQuery.sizeOf(context).width,
                    height: 60,
                    color: Colors.black,
                    text: "Update",
                    onTap: () {
                      profile.updateUserData(context);
                    },
                  )
                ],
              ),
            )
          ],
        );
      }),
    );
  }
}
