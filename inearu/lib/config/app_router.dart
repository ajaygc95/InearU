import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inearu/LoadingScreen.dart';
import 'package:inearu/models/models.dart';
import 'package:inearu/models/profile_model.dart';
import 'package:inearu/pages/OnBoardingPage.dart';
import 'package:inearu/pages/UserScreen.dart';
import 'package:inearu/pages/api_profile_screen.dart';
import 'package:inearu/pages/bloc_counter.dart';
import 'package:inearu/pages/chat_page.dart';
import 'package:inearu/pages/chat_screen.dart';
import 'package:inearu/pages/matches_screen.dart';
import 'package:inearu/pages/onboarding_screen.dart';
import 'package:inearu/pages/user_detail_screen.dart';
import 'package:inearu/screen/profile_screen.dart';
import 'package:inearu/screen/login_screen.dart';
import 'package:inearu/test_pages/profile_page.dart';
import 'package:inearu/test_pages/stream_page.dart';

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
      case TestProfileScreen.routename:
        return MaterialPageRoute(
          builder: (context) => TestProfileScreen(),
        );
      case LoginScreen.routename:
        return MaterialPageRoute(
          builder: (context) => LoginScreen(),
        );
      // case ChatPage.routename:
      //   return MaterialPageRoute(
      //     builder: (context) => ChatPage(),
      //   );
      case OnboardingScreen.routename:
        return MaterialPageRoute(
          builder: (context) => OnboardingScreen(),
        );
      case StreamScreen.routename:
        return MaterialPageRoute(
          builder: (context) => StreamScreen(),
        );
      case CounterScreen.routename:
        return MaterialPageRoute(
          builder: (context) => CounterScreen(),
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
      case ApiProfileScreen.routename:
        return MaterialPageRoute(
          builder: (context) =>
              ApiProfileScreen(token: settings.arguments as String),
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
