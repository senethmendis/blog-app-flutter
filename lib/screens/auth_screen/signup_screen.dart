import 'package:blog_app/components/custom_buttons/custom_button_wthicon.dart';
import 'package:blog_app/components/custom_fileds/custom_textfiled.dart';
import 'package:blog_app/components/custom_text/custom_poppingtext.dart';
import 'package:blog_app/providers/signup_provider.dart';
import 'package:blog_app/screens/auth_screen/signin_screen.dart';
import 'package:blog_app/screens/home_screen/home/widget/custom_icon_button.dart';
import 'package:blog_app/utils/custom_navigator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Consumer<SignUpProvider>(builder: (context, value, child) {
          return Column(
            children: [
              Container(
                height: 200,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/splsh.png'),
                        fit: BoxFit.cover)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SafeArea(
                    child: Stack(children: [
                      Row(
                        children: [
                          CustomIconButton(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              color: Colors.white,
                              iconColor: Colors.black,
                              icon: Icons.arrow_back_ios_new),
                          const SizedBox(width: 20),
                          const CustomPoppingText(
                            text: "Sign Up",
                            color: Colors.white,
                            fontSize: 24,
                          )
                        ],
                      ),
                    ]),
                  ),
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      CustomTextFiled(
                        controller: value.nameController,
                        lable: "User Name",
                      ),
                      const SizedBox(height: 20),
                      CustomTextFiled(
                        controller: value.emailController,
                        lable: "Email",
                      ),
                      const SizedBox(height: 20),
                      CustomTextFiled(
                        isPassword: true,
                        controller: value.passwordController,
                        lable: "Password",
                      ),
                      const SizedBox(height: 20),
                      CustomTextFiled(
                        controller: value.confirmPasswordController,
                        lable: "Confirm Password",
                        isPassword: true,
                      ),
                      const SizedBox(height: 20),
                      CustomButtonWithIcon(
                        width: MediaQuery.sizeOf(context).width,
                        height: 60,
                        text: "Create Account",
                        color: Colors.black,
                        onTap: () {
                          value.startSignUp();
                        },
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const CustomPoppingText(
                            text: "Don't have any account?",
                            fontSize: 16,
                          ),
                          InkWell(
                            onTap: () {
                              CustomNavigator.goto(context, const SignInPage());
                            },
                            child: const CustomPoppingText(
                              text: " SignIn",
                              fontSize: 16,
                              color: Colors.pink,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
