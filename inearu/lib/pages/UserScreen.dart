import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inearu/bloc/swipe_bloc.dart';
import 'package:inearu/models/models.dart';
import 'package:inearu/pages/chat_page.dart';
import 'package:inearu/pages/matches_screen.dart';
import 'package:inearu/widgets/widgets.dart';

class UserScreen extends StatelessWidget {
  static const String routename = '/UserS';
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Color.fromARGB(255, 62, 18, 18)),
        elevation: 0,
        title: Row(
          children: [
            Text('SpotMate', style: Theme.of(context).textTheme.headline2),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MatchesScreen()));
            },
            icon: Icon(
              Icons.send,
              color: Color.fromARGB(255, 185, 63, 42),
            ),
            color: Colors.black87,
          )
        ],
      ),
      body: BlocBuilder<SwipeBloc, SwipeState>(
        builder: (context, state) {
          if (state is SwipeLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is SwipeLoaded) {
            return Column(
              children: [
                InkWell(
                  onDoubleTap: () {
                    Navigator.pushNamed(context, '/profile',
                        arguments: state.users[0]);
                  },
                  child: Draggable(
                    child: UserCard(user: state.users[0]),
                    feedback: UserCard(user: state.users[0]),
                    childWhenDragging: UserCard(user: state.users[1]),
                    onDragEnd: (drag) {
                      if (drag.velocity.pixelsPerSecond.dx < 0) {
                        print('Swiped left');
                        context.read<SwipeBloc>()
                          ..add(
                            SwipeLeft(user: state.users[0]),
                          );
                      } else {
                        print('Swiped right');
                        context.read<SwipeBloc>()
                          ..add(
                            SwipeRight(user: state.users[0]),
                          );
                      }
                    },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 60),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          print("Not liked");
                          context.read<SwipeBloc>()
                            ..add(
                              SwipeLeft(user: state.users[0]),
                            );
                        },
                        child: ChoiceButton(
                          hasGradient: false,
                          color: Colors.red,
                          icon: Icons.clear_outlined,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          print("Liked");
                          context.read<SwipeBloc>()
                            ..add(
                              SwipeRight(user: state.users[0]),
                            );
                        },
                        child: ChoiceButton(
                          height: 80,
                          width: 80,
                          size: 35,
                          hasGradient: true,
                          color: Colors.white,
                          icon: Icons.favorite,
                        ),
                      ),
                      ChoiceButton(
                        hasGradient: false,
                        color: Colors.blue,
                        icon: Icons.info,
                      ),
                    ],
                  ),
                ),
              ],
            );
          } else {
            return Text("Something Went Wrong!!!");
          }
        },
      ),
    );
  }
}

// Draggable(
//             child: UserCard(user: User.users[0]),
//             feedback: UserCard(user: User.users[0]),
//             childWhenDragging: UserCard(user: User.users[1]),
//             onDragEnd: (drag) {
//               if (drag.velocity.pixelsPerSecond.dx < 0) {
//                 print('Swiped left');
//               } else {
//                 print('Swiped right');
//               }
//             },
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 60),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 ChoiceButton(
//                   height: 60,
//                   width: 60,
//                   size: 30,
//                   hasGradient: false,
//                   color: Colors.red,
//                   icon: Icons.clear_outlined,
//                 ),
//                 ChoiceButton(
//                   height: 80,
//                   width: 80,
//                   size: 35,
//                   hasGradient: true,
//                   color: Colors.white,
//                   icon: Icons.favorite,
//                 ),
//                 ChoiceButton(
//                   height: 60,
//                   width: 60,
//                   size: 30,
//                   hasGradient: false,
//                   color: Colors.blue,
//                   icon: Icons.info,
//                 ),
//               ],
//             ),
//           ),

// class _Body extends StatelessWidget {
//   final User user;
//   const _Body({super.key, required this.user});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         // Container(
//         //   padding: EdgeInsets.all(20),
//         //   child: Row(
//         //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         //     children: [
//         //       Text(
//         //         "Discover",
//         //         style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
//         //       ),
//         //       Icon(
//         //         Icons.arrow_forward_ios,
//         //         size: 30,
//         //       ),
//         //     ],
//         //   ),
//         // ),
//         // SizedBox(
//         //   height: 20,
//         // ),
//         Expanded(
//           flex: 8,
//           child: Container(
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(20),
//               boxShadow: [
//                 BoxShadow(blurRadius: 4.0),
//               ],
//             ),
//             child: ClipRRect(
//               borderRadius: BorderRadius.all(Radius.circular(15)),
//               child: Stack(
//                 children: [
//                   Image.network(
//                     'https://images.unsplash.com/photo-1663024718100-9250a83a1db5?ixlib=rb-1.2.1&ixid=Mn',
//                     fit: BoxFit.cover,
//                   ),
//                   Positioned(
//                     bottom: 0,
//                     child: Container(
//                       decoration:
//                           BoxDecoration(color: Colors.black.withOpacity(0.3)),
//                       padding:
//                           EdgeInsets.symmetric(vertical: 8, horizontal: 16),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Row(
//                             children: [
//                               Text(
//                                 "Jane Smith",
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 24,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                               SizedBox(
//                                 width: 20,
//                               ),
//                               Text(
//                                 "25",
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 24,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                             ],
//                           ),
//                           SizedBox(
//                             height: 5,
//                           ),
//                           Container(
//                             padding: EdgeInsets.only(left: 5),
//                             child: Text(
//                               "Software Engineer",
//                               style:
//                                   TextStyle(color: Colors.white, fontSize: 16),
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//         Expanded(
//           flex: 2,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               Container(
//                 height: 50,
//                 width: 50,
//                 padding: EdgeInsets.all(5),
//                 decoration: BoxDecoration(
//                   color: Color.fromARGB(255, 240, 236, 236),
//                   boxShadow: [
//                     BoxShadow(blurRadius: 50),
//                   ],
//                   borderRadius: BorderRadius.all(
//                     Radius.circular(25),
//                   ),
//                 ),
//                 child: Icon(
//                   Icons.close,
//                   color: Colors.red,
//                   size: 30,
//                 ),
//               ),
//               Container(
//                 height: 70,
//                 width: 70,
//                 padding: EdgeInsets.all(5),
//                 decoration: BoxDecoration(
//                     gradient: LinearGradient(colors: [Colors.red, Colors.pink]),
//                     borderRadius: BorderRadius.circular(35),
//                     boxShadow: [BoxShadow(blurRadius: 10)]),
//                 child: Icon(
//                   Icons.favorite,
//                   color: Color.fromARGB(255, 252, 252, 252),
//                   size: 40,
//                 ),
//               ),
//               Container(
//                 height: 50,
//                 width: 50,
//                 padding: EdgeInsets.all(5),
//                 decoration: BoxDecoration(
//                   color: Color.fromARGB(255, 240, 236, 236),
//                   boxShadow: [
//                     BoxShadow(blurRadius: 50),
//                   ],
//                   borderRadius: BorderRadius.all(
//                     Radius.circular(25),
//                   ),
//                 ),
//                 child: Icon(
//                   Icons.info,
//                   color: Color.fromARGB(255, 53, 151, 237),
//                   size: 30,
//                 ),
//               ),
//             ],
//           ),
//         )
//       ],
//     );
//   }
// }

// Container(
//       width: double.infinity,
//       height: double.infinity,
//       color: Colors.blue.shade300,
//       child: Center(
//         child: Container(
//           height: 150,
//           width: 150,
//           decoration: BoxDecoration(
//             color: Colors.amberAccent,
//             // borderRadius: BorderRadius.only(
//             //   // topLeft: Radius.circular(20),
//             //   topRight: Radius.circular(50),
//             //   bottomLeft: Radius.circular(50),
//             // ),
//             border: Border.all(
//               width: 2,
//               color: Colors.white,
//             ),
//             boxShadow: [
//               BoxShadow(
//                 blurRadius: 20,
//                 color: Colors.red,
//                 spreadRadius: 5,
//               ),
//             ],
//             shape: BoxShape.rectangle,
//           ),
//         ),
//       ),
//     );

// return Column(
//   children: <Widget>[
//     Container(
//       width: double.infinity,
//       height: double.infinity,
//       color: Color.fromARGB(255, 23, 113, 177),
//       child: Text("Discover"),
//     ),
//     Expanded(
//       child: Image.network(
//         'https://images.unsplash.com/photo-1663024718100-9250a83a1db5?ixlib=rb-1.2.1&ixid=Mn',
//         fit: BoxFit.cover,
//       ),
//     ),
//     Container(
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: <Widget>[
//           FloatingActionButton(
//             child: Icon(Icons.add),
//             onPressed: () {},
//           ),
//           FloatingActionButton(
//             child: Icon(Icons.search),
//             onPressed: () {},
//           ),
//           FloatingActionButton(
//             child: Icon(Icons.favorite),
//             onPressed: () {},
//           ),
//         ],
//       ),
//     ),
//     // BottomNavigationBar(
//     //   items: const <BottomNavigationBarItem>[
//     //     BottomNavigationBarItem(
//     //       icon: Icon(Icons.home),
//     //       // title: Text('Home'),
//     //     ),
//     //     BottomNavigationBarItem(
//     //       icon: Icon(Icons.search),
//     //       // title: Text('Search'),
//     //     ),
//     //     BottomNavigationBarItem(
//     //       icon: Icon(Icons.person),
//     //       // title: Text('Profile'),
//     //     ),
//     //   ],
//     //   currentIndex: 0,
//     //   selectedItemColor: Colors.blue,
//     //   onTap: (int index) {},
//     // ),
//   ],
// );
