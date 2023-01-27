import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inearu/LoadingScreen.dart';
import 'package:inearu/models/models.dart';
import 'package:inearu/pages/OnBoardingPage.dart';
import 'package:inearu/pages/UserScreen.dart';
import 'package:inearu/pages/onboarding_screen.dart';
import 'package:inearu/pages/profile.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case "/onboardingscreen":
      //   return MaterialPageRoute(
      //     builder: (context) => OnboardingScreen(),
      //   );
      case "/profile":
        return MaterialPageRoute(
          builder: (context) => ProfileScreen(user: settings.arguments as User),
        );
      case UserScreen.routename:
        return MaterialPageRoute(
          builder: (context) => UserScreen(),
        );
      case OnboardingScreen.routename:
        return MaterialPageRoute(
          builder: (context) => OnboardingScreen(),
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
