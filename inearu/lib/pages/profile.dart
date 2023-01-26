import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:inearu/models/models.dart';
import 'package:inearu/widgets/choice_button.dart';

class ProfileScreen extends StatelessWidget {
  static const String routename = '/profile';

  ProfileScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final User user = User.users[0];
    double height = MediaQuery.of(context).size.height / 2;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          SizedBox(
            height: height,
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 40),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: NetworkImage(User.users[0].imageUrls[0]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 60),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ChoiceButton(
                          height: 60,
                          width: 60,
                          size: 30,
                          hasGradient: false,
                          color: Colors.red,
                          icon: Icons.clear_outlined,
                        ),
                        ChoiceButton(
                          height: 80,
                          width: 80,
                          size: 30,
                          hasGradient: true,
                          color: Colors.white,
                          icon: Icons.favorite,
                        ),
                        ChoiceButton(
                          height: 60,
                          width: 60,
                          size: 30,
                          hasGradient: false,
                          color: Colors.red,
                          icon: Icons.info,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${user.firstName} ${user.age}',
                    style: Theme.of(context).textTheme.headline2),
                Text('${user.jobTitle} ',
                    style: Theme.of(context)
                        .textTheme
                        .headline3!
                        .copyWith(fontWeight: FontWeight.normal)),
                SizedBox(
                  height: 20,
                ),
                Text('About', style: Theme.of(context).textTheme.headline3),
                SizedBox(
                  height: 15,
                ),
                Text(
                  '${user.bio} ',
                  style: Theme.of(context)
                      .textTheme
                      .headline5!
                      .copyWith(fontWeight: FontWeight.normal, height: 2),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
