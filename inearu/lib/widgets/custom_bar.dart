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
      elevation: 0,
      title: Row(children: [
        Expanded(
          child: Container(
            child: SvgPicture.asset(
              'assets/Youtube.svg',
              height: 50,
              color: Color.fromARGB(255, 25, 202, 149),
            ),
          ),
        ),
        // Expanded(
        //     flex: 2,
        //     child: Text(
        //       title,
        //       style: TextStyle(
        //         fontSize: 32,
        //         color: Colors.blueGrey,
        //       ),
        //     )),
      ]),
      actions: hasActions
          ? [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                child: IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/matchescreen');
                    },
                    icon: Icon(
                      Icons.send_rounded,
                      color: Colors.blueGrey,
                      size: 40,
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
