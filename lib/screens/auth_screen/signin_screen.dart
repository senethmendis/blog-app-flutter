import 'package:blog_app/components/custom_buttons/custom_button_wthicon.dart';
import 'package:blog_app/components/custom_fileds/custom_textfiled.dart';
import 'package:blog_app/components/custom_text/custom_poppingtext.dart';
import 'package:blog_app/providers/signin_provider.dart';
import 'package:blog_app/screens/auth_screen/forget_password_screen.dart';
import 'package:blog_app/screens/auth_screen/signup_screen.dart';
import 'package:blog_app/utils/custom_navigator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/splsh.png'),
                  fit: BoxFit.cover)),
          child: Stack(children: [
            Positioned(
              top: 140,
              left: MediaQuery.sizeOf(context).width * 0.38,
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: const DecorationImage(
                        image: AssetImage('assets/images/appicon.png'))),
              ),
            ),
          ]),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height * 0.6,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(60))),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Consumer<SignInProvider>(builder: (context, value, child) {
                return Column(
                  children: [
                    const CustomPoppingText(
                      text: "SignIn",
                      fontSize: 28,
                    ),
                    const SizedBox(height: 20),
                    CustomTextFiled(
                      controller: value.emailController,
                      lable: "Email",
                    ),
                    const SizedBox(height: 20),
                    CustomTextFiled(
                      controller: value.passwordController,
                      lable: "Password",
                      isPassword: true,
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            CustomNavigator.goto(
                                context, const ForgetPassWord());
                          },
                          child: const CustomPoppingText(
                            text: "Forget Passoword",
                            fontSize: 16,
                            color: Colors.pink,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    CustomButtonWithIcon(
                      onTap: () {
                        value.startSignIn();
                        //CustomNavigator.goto(context, const HomeScreen());
                      },
                      text: "Signin",
                      icon: Icons.donut_large_rounded,
                      width: MediaQuery.sizeOf(context).width,
                      height: 60,
                      color: Colors.black,
                    ),
                    const SizedBox(height: 20),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CustomPoppingText(
                          text: "Don't have any account?",
                          fontSize: 16,
                        ),
                        InkWell(
                          onTap: () {
                            CustomNavigator.goto(context, const SignUpPage());
                          },
                          child: const CustomPoppingText(
                            text: " Sign Up",
                            fontSize: 16,
                            color: Colors.pink,
                          ),
                        ),
                      ],
                    )
                  ],
                );
              }),
            ),
          ),
        ),
      ],
    ));
  }
}
