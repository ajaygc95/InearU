import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inearu/LoadingScreen.dart';
import 'package:inearu/config/app_router.dart';
import 'package:inearu/config/custom_theme.dart';
import 'package:inearu/pages/OnBoardingPage.dart';
import 'package:inearu/pages/UserScreen.dart';
import 'package:inearu/bloc/swipe_bloc.dart';
import 'package:inearu/pages/onboarding_screen.dart';
import 'package:inearu/pages/profile.dart';
import 'models/models.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (_) => SwipeBloc()..add(LoadUsers(users: User.users)))
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme(),
        onGenerateRoute: RouteGenerator.generateRoute,
        initialRoute: UserScreen.routename,
      ),
    );
  }
}


// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   const
//   @override
//   Widget build(BuildContext context) {
//     return MultiBlocProvider(
//       providers: [
//         BlocProvider(
//             create: (_) => SwipeBloc()..add(LoadUsers(users: User.users)))
//       ],
//       child: MaterialApp(
//         debugShowCheckedModeBanner: false,
//         title: "Near Me!",
//         theme: theme(),
//         onGenerateRoute: RouteGenerator.generateRoute,
//         initialRoute: '/',
//       ),
//     );
//   }
// }
