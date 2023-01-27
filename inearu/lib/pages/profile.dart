import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:inearu/models/models.dart';
import 'package:inearu/widgets/choice_button.dart';

class ProfileScreen extends StatelessWidget {
  static const String routename = '/profile';
  const ProfileScreen({super.key, required this.user});
  final User user;
  @override
  Widget build(BuildContext context) {
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
                  child: Hero(
                    tag: 'user_image',
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey,
                        image: DecorationImage(
                          image: NetworkImage(user.imageUrls[0]),
                          fit: BoxFit.cover,
                        ),
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
                          hasGradient: false,
                          color: Colors.red,
                          icon: Icons.clear_outlined,
                        ),
                        ChoiceButton(
                          height: 80,
                          width: 80,
                          size: 35,
                          hasGradient: true,
                          color: Colors.white,
                          icon: Icons.favorite,
                        ),
                        ChoiceButton(
                          hasGradient: false,
                          color: Colors.blue.shade300,
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
                SizedBox(
                  height: 15,
                ),
                Text('Interests', style: Theme.of(context).textTheme.headline3),
                Wrap(
                  spacing: 8.0, // gap between adjacent chips
                  runSpacing: 4.0, // gap between lines
                  children: <Widget>[
                    Chip(
                      avatar: CircleAvatar(
                          backgroundColor: Colors.blue.shade900,
                          child: Text('AH')),
                      label: Text('Hamilton'),
                    ),
                    Chip(
                      avatar: CircleAvatar(
                          backgroundColor: Colors.blue.shade900,
                          child: Text('ML')),
                      label: Text('Lafayette'),
                    ),
                    Chip(
                      avatar: CircleAvatar(
                          backgroundColor: Colors.blue.shade900,
                          child: Text('HM')),
                      label: Text('Mulligan'),
                    ),
                    Chip(
                      avatar: CircleAvatar(
                          backgroundColor: Colors.blue.shade900,
                          child: Text('JL')),
                      label: Text('Laurens'),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
