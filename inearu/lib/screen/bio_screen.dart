import 'package:flutter/material.dart';
import 'package:inearu/widgets/widgets.dart';

class BioScreen extends StatelessWidget {
  final TabController tabController;
  const BioScreen({super.key, required this.tabController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextHeader(
                  tabController: tabController, text: "Describe Yourself"),
              CustomTextField(
                text: 'TYPE HERE',
                tabController: tabController,
              ),
              SizedBox(height: 100),
              CustomTextHeader(
                  tabController: tabController, text: "What Do You Like?"),
              SizedBox(height: 20),
              Row(children: [
                CustomTextContainer(text: "Music"),
                CustomTextContainer(text: "Dance"),
                CustomTextContainer(text: "Sports"),
                CustomTextContainer(text: "Movies"),
                CustomTextContainer(text: "Art"),
              ]),
              Row(children: [
                CustomTextContainer(text: "COffee"),
                CustomTextContainer(text: "Tv series"),
                CustomTextContainer(text: "Friends"),
                CustomTextContainer(text: "Beaches"),
              ]),
              Row(children: [
                CustomTextContainer(text: "Programming"),
                CustomTextContainer(text: "Clubbing"),
                CustomTextContainer(text: "Sports"),
                CustomTextContainer(text: "Lazy"),
              ]),
            ],
          ),
          CustomBotton(tabController: tabController, text: 'Next Step'),
        ],
      ),
    );
  }
}
