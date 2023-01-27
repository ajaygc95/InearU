import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String text;
  final TabController tabController;
  const CustomTextField(
      {super.key, required this.tabController, required this.text});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: text,
        contentPadding: EdgeInsets.only(
          bottom: 5.0,
          top: 12.0,
        ),
        focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
        enabledBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
      ),
    );
  }
}
