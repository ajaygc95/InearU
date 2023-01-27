import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:inearu/models/models.dart';
import 'package:inearu/widgets/user_small_card.dart';

class MatchesScreen extends StatelessWidget {
  static const String routename = '/messagescreen';
  const MatchesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final inactiveMatches = UserMatch.matches
        .where((match) => match.userId == 1 && match.chat!.isEmpty)
        .toList();
    final activeMatches = UserMatch.matches
        .where((match) => match.userId == 1 && match.chat!.isNotEmpty)
        .toList();

    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Your Matches",
                  style: Theme.of(context).textTheme.headline4,
                ),
                SizedBox(
                  height: 5,
                ),
                SizedBox(
                  height: 100,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: inactiveMatches.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          UserSamllCard(
                            height: 70,
                            width: 70,
                            imageUrl:
                                inactiveMatches[index].matchedUser.imageUrls[0],
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Text(
                            inactiveMatches[index].matchedUser.firstName,
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith(fontWeight: FontWeight.normal),
                          )
                        ],
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Your Chats",
                  style: Theme.of(context).textTheme.headline4,
                ),
                ListView.builder(
                  itemCount: activeMatches.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, "/chatscreen",
                            arguments: activeMatches[index]);
                      },
                      child: Row(
                        children: [
                          UserSamllCard(
                            imageUrl:
                                activeMatches[index].matchedUser.imageUrls[0],
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  activeMatches[index].matchedUser.firstName,
                                  style: Theme.of(context).textTheme.headline5,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  activeMatches[index]
                                      .chat![0]
                                      .messages[0]
                                      .message,
                                  style: Theme.of(context).textTheme.headline6,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  activeMatches[index]
                                      .chat![0]
                                      .messages[0]
                                      .timeString,
                                  style: Theme.of(context).textTheme.headline6,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ));
  }
}
