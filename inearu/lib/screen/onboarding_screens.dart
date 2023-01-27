import 'package:flutter/material.dart';
import 'package:inearu/widgets/widgets.dart';

import 'screen.dart';

class OnBoardingScreen extends StatefulWidget {
  static const String routeName = '/onboarding';

  OnBoardingScreen({super.key});
  final List<Tab> tabs = <Tab>[
    Tab(text: 'Start'),
    Tab(text: 'Email'),
    Tab(text: 'Address'),
    Tab(text: 'EmailVerification'),
    Tab(text: 'DemoScreen'),
    Tab(text: 'PictureScreen'),
    Tab(text: 'BioScreen')
  ];

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.tabs.length,
      child: Builder(builder: (BuildContext context) {
        final TabController tabController = DefaultTabController.of(context)!;
        tabController.addListener(() {
          if (!tabController.indexIsChanging) {}
        });

        return Scaffold(
          appBar: CustomAppBar(
            title: 'ARROW',
            hasActions: false,
          ),
          body: TabBarView(
            children: [
              Start(tabController: tabController),
              Email(tabController: tabController),
              Address(tabController: tabController),
              EmailVerification(tabController: tabController),
              DemoScreen(tabController: tabController),
              PictureScreen(tabController: tabController),
              BioScreen(tabController: tabController)
            ],
          ),
        );
      }),
    );
  }
}
