import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:inearu/screen/screen.dart';

class OnboardingScreen extends StatelessWidget {
  static const String routename = '/onboardingscreen';
  OnboardingScreen({super.key});
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
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Builder(builder: (BuildContext context) {
        final TabController tabController = DefaultTabController.of(context)!;
        tabController.addListener(() {
          if (!tabController.indexIsChanging) {}
        });
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
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
