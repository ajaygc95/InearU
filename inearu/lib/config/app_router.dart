import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inearu/LoadingScreen.dart';
import 'package:inearu/models/models.dart';
import 'package:inearu/pages/OnBoardingPage.dart';
import 'package:inearu/pages/UserScreen.dart';
import 'package:inearu/pages/chat_screen.dart';
import 'package:inearu/pages/matches_screen.dart';
import 'package:inearu/pages/onboarding_screen.dart';
import 'package:inearu/pages/user_detail_screen.dart';
import 'package:inearu/screen/profile_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case "/onboardingscreen":
      //   return MaterialPageRoute(
      //     builder: (context) => OnboardingScreen(),
      //   );
      case ProfileScreen.routename:
        return MaterialPageRoute(
          builder: (context) => ProfileScreen(),
        );
      case UserDetailScreen.routename:
        return MaterialPageRoute(
          builder: (context) =>
              UserDetailScreen(user: settings.arguments as User),
        );
      case UserScreen.routename:
        return MaterialPageRoute(
          builder: (context) => UserScreen(),
        );
      case OnboardingScreen.routename:
        return MaterialPageRoute(
          builder: (context) => OnboardingScreen(),
        );
      case MatchesScreen.routename:
        return MaterialPageRoute(
          builder: (context) => MatchesScreen(),
        );
      case ChatScreen.routename:
        return MaterialPageRoute(
          builder: (context) =>
              ChatScreen(userMatch: settings.arguments as UserMatch),
        );
      default:
        return _errorRoute();
    }
  }
}

Route<dynamic> _errorRoute() {
  return MaterialPageRoute(builder: (context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ERROR'),
        centerTitle: true,
      ),
      body: Center(child: Text('Page not found')),
    );
  });
}
