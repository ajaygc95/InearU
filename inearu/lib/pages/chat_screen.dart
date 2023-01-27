import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:inearu/models/models.dart';

class ChatScreen extends StatelessWidget {
  static const String routename = '/chatscreen';
  final UserMatch userMatch;
  const ChatScreen({super.key, required this.userMatch});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: Color.fromARGB(255, 62, 18, 18)),
        backgroundColor: Colors.amber.shade800,
        centerTitle: true,
        title: Column(
          children: [
            CircleAvatar(
              radius: 15,
              backgroundImage: NetworkImage(userMatch.matchedUser.imageUrls[0]),
            ),
            Text(userMatch.matchedUser.firstName)
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: userMatch.chat != null
                  ? Container(
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: userMatch.chat![0].messages.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: userMatch
                                          .chat![0].messages[index].senderId ==
                                      1
                                  ? Container(
                                      margin: EdgeInsets.only(left: 40),
                                      child: Align(
                                          alignment: Alignment.topRight,
                                          child: Expanded(
                                            child: Container(
                                              padding: EdgeInsets.all(10),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(10),
                                                  ),
                                                  color: Color.fromARGB(
                                                      255, 65, 164, 245)),
                                              child: Text(
                                                userMatch.chat![0]
                                                    .messages[index].message,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline5!
                                                    .copyWith(
                                                        fontWeight:
                                                            FontWeight.normal),
                                              ),
                                            ),
                                          )),
                                    )
                                  : Container(
                                      margin: EdgeInsets.only(right: 40),
                                      child: Align(
                                          alignment: Alignment.topLeft,
                                          child: Row(children: [
                                            CircleAvatar(
                                              radius: 15,
                                              backgroundColor: Colors.grey,
                                              backgroundImage: NetworkImage(
                                                userMatch
                                                    .matchedUser.imageUrls[0],
                                              ),
                                            ),
                                            SizedBox(width: 2),
                                            Expanded(
                                              child: Container(
                                                padding: EdgeInsets.all(10),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                      Radius.circular(10),
                                                    ),
                                                    color: Color.fromARGB(
                                                        255, 218, 216, 216)),
                                                child: Flexible(
                                                  child: Text(
                                                    userMatch
                                                        .chat![0]
                                                        .messages[index]
                                                        .message,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .headline5!
                                                        .copyWith(
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ])),
                                    ),
                            );
                          }),
                    )
                  : SizedBox(),
            ),
          ),
          Container(
            height: 100,
            padding: EdgeInsets.only(right: 20),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 63, 238, 223)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromARGB(255, 72, 74, 196)),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Type Here...',
                      contentPadding: EdgeInsets.only(
                        left: 20,
                        bottom: 5,
                        top: 5,
                      ),
                    ),
                  ),
                ),
                IconButton(
                  color: Colors.blue,
                  onPressed: () {},
                  icon: Icon(Icons.send_outlined),
                ),
              ],
            ),
          )
        ],
      ),

      // body: SingleChildScrollView(
      //   child: userMatch.chat != null
      //       ? Container(
      //           child: ListView.builder(
      //             shrinkWrap: true,
      //             itemCount: userMatch.chat![0].messages.length,
      //             itemBuilder: (context, index) {
      //               return ListTile(
      //                 title: userMatch.chat![0].messages[index].senderId == 1
      //                     ? SizedBox(
      //                         width: MediaQuery.of(context).size.width * 0.7,
      //                         child: Container(
      //                           color: Colors.blue,
      //                           child: SingleChildScrollView(
      //                             child: Text('Dynamic text here'),
      //                           ),
      //                         ),
      //                       )

      //                     // ? Align(
      //                     //     alignment: Alignment.topRight,
      //                     //     child: FractionallySizedBox(
      //                     //       widthFactor: 0.8,
      //                     //       child: Container(
      //                     //         padding: EdgeInsets.symmetric(
      //                     //             vertical: 5, horizontal: 10),
      //                     //         margin: EdgeInsets.all(5),
      //                     //         decoration: BoxDecoration(
      //                     //             color:
      //                     //                 Color.fromARGB(255, 87, 167, 231),
      //                     //             borderRadius:
      //                     //                 BorderRadius.circular(15)),
      //                     //         child: Text(
      //                     //           userMatch
      //                     //               .chat![0].messages[index].message,
      //                     //           style: TextStyle(fontSize: 15),
      //                     //         ),
      //                     //       ),
      //                     //     ),
      //                     //   )
      //                     : Align(
      //                         alignment: Alignment.topLeft,
      //                         child: FractionallySizedBox(
      //                           widthFactor: 0.8,
      //                           child: Row(
      //                             children: [
      //                               CircleAvatar(
      //                                 radius: 15,
      //                                 backgroundImage: NetworkImage(
      //                                     userMatch.matchedUser.imageUrls[0]),
      //                               ),
      //                               SizedBox(
      //                                 width: 5,
      //                               ),
      //                               Flexible(
      //                                 child: Container(
      //                                   padding: EdgeInsets.symmetric(
      //                                       vertical: 10, horizontal: 20),
      //                                   margin: EdgeInsets.all(5),
      //                                   decoration: BoxDecoration(
      //                                       color: Color.fromARGB(
      //                                           255, 207, 207, 204),
      //                                       borderRadius:
      //                                           BorderRadius.circular(15)),
      //                                   child: Text(
      //                                     userMatch.chat![0].messages[index]
      //                                         .message,
      //                                     style: TextStyle(fontSize: 15),
      //                                   ),
      //                                 ),
      //                               ),
      //                             ],
      //                           ),
      //                         ),
      //                       ),
      //               );
      //             },
      //           ),
      //         )
      //       : SizedBox(),
      // ),
    );
  }
}
