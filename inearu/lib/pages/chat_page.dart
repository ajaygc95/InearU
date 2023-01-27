import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Draggable(
          feedback: Squarewidget(text: "Dragged", color: Colors.red),
          child: Squarewidget(text: "Drag Me", color: Colors.yellow),
          childWhenDragging: Squarewidget(text: "", color: Colors.transparent),
        ),
      ),
    );
  }
}

class Squarewidget extends StatelessWidget {
  final Color color;
  final String text;
  Squarewidget({super.key, required this.color, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      color: color,
      child: Center(
          child: Text(
        '$text',
        style: TextStyle(fontSize: 30, color: Colors.purple),
      )),
    );
  }
}
