import 'package:flutter/material.dart';

class CustomTextFiled extends StatefulWidget {
  const CustomTextFiled(
      {super.key,
      this.lable = "",
      this.icon = Icons.email_sharp,
      this.isPassword = false,
      this.isIcon = false,
      this.visibil = false,
      this.keyboardType = TextInputType.text,
      required this.controller});

  final String lable;
  final IconData icon;
  final bool isPassword;
  final bool isIcon;
  final bool visibil;
  final TextInputType keyboardType;

  final TextEditingController controller;

  @override
  State<CustomTextFiled> createState() => _CustomTextFiledState();
}

class _CustomTextFiledState extends State<CustomTextFiled> {
  bool isObscure = false;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: widget.keyboardType,
      controller: widget.controller,
      obscureText: isObscure,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(15)),
        label: Text(widget.lable),
        prefixIcon: widget.isIcon ? Icon(widget.icon) : null,
        suffixIcon: widget.isPassword
            ? InkWell(
                onTap: () {
                  setState(() {
                    isObscure = !isObscure;
                  });
                },
                child: Icon(
                    widget.visibil ? Icons.visibility : Icons.visibility_off))
            : null,
      ),
    );
  }
}
