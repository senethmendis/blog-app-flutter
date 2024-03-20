import 'package:blog_app/components/custom_buttons/custom_button_wthicon.dart';
import 'package:blog_app/components/custom_fileds/custom_textfiled.dart';
import 'package:blog_app/components/custom_text/custom_poppingtext.dart';
import 'package:blog_app/providers/signin_provider.dart';
import 'package:blog_app/screens/home_screen/home/widget/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ForgetPassWord extends StatelessWidget {
  const ForgetPassWord({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Consumer<SignInProvider>(builder: (context, value, child) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      CustomIconButton(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          color: Colors.black,
                          iconColor: Colors.white,
                          icon: Icons.arrow_back_ios_new),
                      const Spacer(),
                      const CustomPoppingText(
                        text: "Reset Your Password",
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  CustomTextFiled(
                      lable: "Email", controller: value.resetEmailController),
                  const SizedBox(height: 20),
                  CustomButtonWithIcon(
                    text: "Reset",
                    width: MediaQuery.sizeOf(context).width,
                    height: 60,
                    color: Colors.black,
                    onTap: () {
                      value.sendResetEmail();
                    },
                  )
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
