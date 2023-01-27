import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:inearu/models/models.dart';
import 'package:inearu/widgets/widgets.dart';

class ProfileScreen extends StatelessWidget {
  static const String routeName = '/profilescreen';
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final User user = User.users[0];
    final TabController tabController;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(title: "PROFILE"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10),
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          offset: Offset(3, 3),
                          blurRadius: 3,
                          spreadRadius: 3),
                    ],
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(user.imageUrls[0]),
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: LinearGradient(
                      colors: [
                        Theme.of(context).primaryColor.withOpacity(0.1),
                        Theme.of(context).primaryColor.withOpacity(0.7),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Text(
                        user.name,
                        style: Theme.of(context)
                            .textTheme
                            .headline1!
                            .copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TitleWithIcon(title: 'Biography', icon: Icons.edit),
                  Text(
                    "Lorem Es un hecho establecido hace demasiado tiempo que un lector se distraerá con el contenido del texto de un sitio mientras que mira su diseño. El punto de usar Lorem Ipsum es que tiene una distribución más o menos normal de las letras",
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  TitleWithIcon(title: 'Pictures', icon: Icons.edit),
                  SizedBox(
                    height: 125,
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: user.imageUrls.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Container(
                              height: 125,
                              width: 90,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                border: Border.all(
                                    color: Theme.of(context).primaryColor),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(user.imageUrls[index]),
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                  TitleWithIcon(title: 'Location', icon: Icons.edit),
                  Text(
                    "Sunnyvale , Ca",
                    style: Theme.of(context)
                        .textTheme
                        .headline3!
                        .copyWith(fontWeight: FontWeight.normal),
                  ),
                  TitleWithIcon(title: 'Interest', icon: Icons.edit),
                  Wrap(
                    direction: Axis.horizontal,
                    children: [
                      CustomTextContainer(text: "Not Babysitting"),
                      CustomTextContainer(text: "Dance "),
                      CustomTextContainer(text: "Doing AJ"),
                      CustomTextContainer(text: "Coffee"),
                      CustomTextContainer(text: "Celebrity Gossips"),
                      CustomTextContainer(text: "Movies"),
                      CustomTextContainer(text: "Soccer"),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TitleWithIcon extends StatelessWidget {
  final String title;
  final IconData icon;
  const TitleWithIcon({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headline3,
        ),
        IconButton(onPressed: () {}, icon: Icon(Icons.edit))
      ],
    );
  }
}
