import 'package:flutter/material.dart';

class CustomTextHeader extends StatelessWidget {
  final String text;
  final TabController tabController;
  const CustomTextHeader({
    super.key,
    required this.text,
    required this.tabController,
  });

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: Theme.of(context)
            .textTheme
            .headline1!
            .copyWith(fontWeight: FontWeight.normal));
  }
}
