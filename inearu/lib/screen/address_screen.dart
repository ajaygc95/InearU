import 'package:flutter/material.dart';
import 'package:inearu/widgets/widgets.dart';

class Address extends StatelessWidget {
  final TabController tabController;
  const Address({super.key, required this.tabController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              CustomTextHeader(
                  tabController: tabController,
                  text: "What's your Phone Number?"),
              CustomTextField(
                text: 'ENTER YOUR PHONE NUMBER',
                tabController: tabController,
              )
            ],
          ),
          CustomBotton(tabController: tabController, text: 'Next Step'),
        ],
      ),
    );
  }
}
