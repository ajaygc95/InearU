import 'package:flutter/material.dart';

class ChoiceButton extends StatelessWidget {
  final double height;
  final double width;
  final Color color;
  final IconData icon;
  final hasGradient;
  final double size;
  
  const ChoiceButton({
    super.key,
    required this.width,
    required this.height,
    required this.color,
    required this.icon,
    required this.hasGradient,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      height: height,
      width: width,
      // color: Colors.limeAccent,
      // ignore: prefer_const_constructors
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        gradient: hasGradient
            ? LinearGradient(colors: [Colors.red, Colors.pink])
            : LinearGradient(colors: [Colors.white, Colors.white]),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withAlpha(50),
            spreadRadius: 4,
            blurRadius: 4,
            offset: Offset(3, 3),
          ),
        ],
      ),
      child: Icon(
        icon,
        color: color,
        size: size,
      ),
    );
  }
}