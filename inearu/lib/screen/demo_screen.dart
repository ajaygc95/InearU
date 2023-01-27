import 'package:flutter/material.dart';
import 'package:inearu/widgets/widgets.dart';

class DemoScreen extends StatelessWidget {
  final TabController tabController;
  const DemoScreen({super.key, required this.tabController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextHeader(
                  tabController: tabController, text: "What's your Gender?"),
              SizedBox(height: 10),
              CustomCheckBox(tabController: tabController, text: "MALE"),
              CustomCheckBox(tabController: tabController, text: "FEMALE"),
              SizedBox(height: 50),
              CustomTextHeader(
                  tabController: tabController, text: "What's your Age?"),
              SizedBox(height: 10),
              CustomTextField(
                text: 'ENTER YOUR AGE',
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
