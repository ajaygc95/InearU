import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

// import 'package:lockfin/widgets/custom_button.dart';
import 'package:inearu/widgets/widgets.dart';

class Start extends StatelessWidget {
  final TabController tabController;

  const Start({super.key, required this.tabController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(children: [
            SvgPicture.asset(
              'assets/two_men.svg',
              height: 200,
              width: 200,
              color: Color.fromARGB(255, 177, 28, 102),
            ),
            SizedBox(height: 50),
            Text(
              'Welcome To LOCKFIND',
              style: Theme.of(context).textTheme.headline2,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Find love in your area with our location-based dating app. + "
              "Easily connect with singles nearby for casual flings or serious +"
              "relationships. Download now and start browsing local profiles today! ",
              textAlign: TextAlign.center,
              style:
                  Theme.of(context).textTheme.headline6!.copyWith(height: 1.6),
            ),
            SizedBox(
              height: 20,
            ),
          ]),
          CustomBotton(
            tabController: tabController,
            text: "START",
          ),
        ],
      ),
    );
  }
}
