import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final bool hasActions;

  const CustomAppBar({
    Key? key,
    this.hasActions = true,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      automaticallyImplyLeading: false,
      iconTheme: IconThemeData(color: Color.fromARGB(255, 62, 18, 18)),
      elevation: 0,
      title: Align(
        child: Container(
          child: Text(
            title,
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      actions: hasActions
          ? [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                child: IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/chatscreen');
                    },
                    icon: Icon(
                      Icons.send_rounded,
                      color: Colors.blueGrey,
                      size: 30,
                    )),
              ),
            ]
          : null,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(56.0);
}
