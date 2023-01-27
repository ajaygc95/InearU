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
    this.width = 60,
    this.height = 60,
    required this.color,
    required this.icon,
    required this.hasGradient,
    this.size = 30,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      height: height,
      width: width,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        gradient: hasGradient
            ? LinearGradient(colors: [Color.fromARGB(255, 123, 52, 46), Color.fromARGB(255, 196, 35, 89)])
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
