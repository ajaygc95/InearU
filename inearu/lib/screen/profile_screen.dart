import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:inearu/models/models.dart';
import 'package:inearu/pages/matches_screen.dart';
import 'package:inearu/widgets/widgets.dart';

class ProfileScreen extends StatelessWidget {
  static const String routename = '/profilescreen';
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final User user = User.users[0];
    final TabController tabController;
    final List<String> savedimages = [
      'https://scontent-sjc3-1.xx.fbcdn.net/v/t39.30808-6/303091320_5167146206686819_6793409820432789032_n.jpg?_nc_cat=102&ccb=1-7&_nc_sid=730e14&_nc_ohc=WkiUYCgzElcAX_TWzUx&_nc_ht=scontent-sjc3-1.xx&oh=00_AfCuChTXgGwPb_NwiH7xbLZeIsVMdsfiwuXGzLT948lrzQ&oe=63D964B8',
      'https://scontent-sjc3-1.xx.fbcdn.net/v/t39.30808-6/302770091_5167128810021892_3004161147708403828_n.jpg?stp=c0.5000x0.3300f_dst-webp_e15_p540x540_q70_tt1_u&efg=eyJ1cmxnZW4iOiJ1cmxnZW5fZnJvbV91cmwifQ&_nc_cid=0&_nc_ad=z-m&_nc_rml=0&_nc_ht=scontent-sjc3-1.xx&_nc_cat=103&_nc_ohc=L63WHLik2aEAX8bvsVK&ccb=1-7&_nc_sid=730e14&oh=00_AfDjMY9VPKOo10ZNTvWJ2hNzXpHW7OM4vw_NhNWD5bn0QQ&oe=63FC13A8',
      'https://scontent-sjc3-1.xx.fbcdn.net/v/t39.30808-6/302476082_5167128806688559_1392340262425430131_n.jpg?stp=c0.5000x0.3300f_dst-webp_e15_p540x540_q70_tt1_u&efg=eyJ1cmxnZW4iOiJ1cmxnZW5fZnJvbV91cmwifQ&_nc_cid=0&_nc_ad=z-m&_nc_rml=0&_nc_ht=scontent-sjc3-1.xx&_nc_cat=109&_nc_ohc=YvfpSslXrG0AX9MSyL_&ccb=1-7&_nc_sid=730e14&oh=00_AfDXZtpLhGZPLG7C8b6XfGVrJKazAf8sfcmGhNG3A6KHOA&oe=63FBFC48',
      'https://scontent-sjc3-1.xx.fbcdn.net/v/t39.30808-6/301579922_5167128803355226_5784226778498535693_n.jpg?stp=c0.5000x0.3300f_dst-webp_e15_p360x360_q70_tt1_u&efg=eyJ1cmxnZW4iOiJ1cmxnZW5fZnJvbV91cmwifQ&_nc_cid=0&_nc_ad=z-m&_nc_rml=0&_nc_ht=scontent-sjc3-1.xx&_nc_cat=110&_nc_ohc=cYHCtzmYX54AX_fSz73&ccb=1-7&_nc_sid=730e14&oh=00_AfBPr--NBKJ1n2UmyBv1HRXLOb6Oy3iWCzFAc5n119I2Vw&oe=63FBFE39',
      'https://scontent-sjc3-1.xx.fbcdn.net/v/t39.30808-6/302901510_5167128790021894_2704987647267603360_n.jpg?stp=dst-webp_e15_q70_s1080x1350_tt1_u&efg=eyJ1cmxnZW4iOiJ1cmxnZW5fZnJvbV91cmwifQ&_nc_cid=0&_nc_ad=z-m&_nc_rml=0&_nc_ht=scontent-sjc3-1.xx&_nc_cat=107&_nc_ohc=JfmfIHmD5W0AX925urS&ccb=1-7&_nc_sid=730e14&oh=00_AfBnjX7Gs4nLc6R0MZUFpxHbktMIAqAQxJMQBOSrgXCttw&oe=63FC0AFC',
    ];
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Color.fromARGB(255, 62, 18, 18)),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MatchesScreen()));
            },
            icon: Icon(
              Icons.send,
              color: Color.fromARGB(255, 60, 54, 52),
            ),
            color: Colors.black87,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10),
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 2,
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
                      image: NetworkImage(
                        savedimages[3],
                      ),
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(0, 0, 0, 0),
                        Colors.black.withOpacity(0.2),
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
                        "Ajay GC",
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
                        itemCount: savedimages.length,
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
                                  image: NetworkImage(savedimages[index]),
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
