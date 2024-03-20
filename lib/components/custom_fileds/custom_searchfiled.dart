import 'package:flutter/material.dart';

class CustomSearchTextFiled extends StatefulWidget {
  const CustomSearchTextFiled(
      {super.key,
      this.lable = "",
      required this.controller,
      required this.hintText});

  final String lable;
  final String hintText;
  final TextEditingController controller;

  @override
  State<CustomSearchTextFiled> createState() => _CustomSearchTextFiledState();
}

class _CustomSearchTextFiledState extends State<CustomSearchTextFiled> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      decoration: InputDecoration(
          fillColor: const Color(0xFFced4da),
          focusColor: const Color(0xFFced4da),
          filled: true,
          focusedBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          disabledBorder: InputBorder.none,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          label: Text(widget.lable),
          hintText: widget.hintText,
          suffixIcon: InkWell(
              onTap: () {},
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Icon(
                  Icons.search,
                  size: 40,
                ),
              ))),
    );
  }
}
