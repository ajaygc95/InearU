import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inearu/bloc/login/login_bloc.dart';
import 'package:inearu/bloc/profile/profile_bloc.dart';
import 'package:inearu/config/app_router.dart';
import 'package:inearu/config/custom_theme.dart';
import 'package:inearu/models/profile_model.dart';
import 'package:inearu/bloc/swipe_bloc.dart';
import 'package:inearu/pages/UserScreen.dart';
import 'package:inearu/screen/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
            create: (_) => SwipeBloc()..add(LoadUsers(users: User.users))),
        BlocProvider(create: (context) => LoginBloc()),
        BlocProvider(
          create: (context) => ProfileBloc()
            ..add(LoadProfile(profiles: [
              ProfileModel(
                id: 1,
                user: 1,
                firstName: "John",
                lastName: "Doe",
                jobTitle: "Software Engineer",
                bio: "Loves coding",
                imageUrls: [
                  "http://localhost:8000/media/images/alcohol.jpg",
                  "http://localhost:8000/media/images/american.png",
                  "http://localhost:8000/media/images/bubbletea.png"
                ],
                interests: ["Programming", "Gaming", "Movies"],
              ),
              ProfileModel(
                id: 2,
                user: 2,
                firstName: "Jane",
                lastName: "Doe",
                jobTitle: "Product Manager",
                bio: "Loves organizing",
                imageUrls: [
                  "http://localhost:8000/media/images/Red_rock_fron_face_PYSOnnx.jpg",
                  "http://localhost:8000/media/images/Red_rock_sitting_kLrxWwj.jpg",
                  "https://picsum.photos/200"
                ],
                interests: ["Music", "Photography", "Hiking"],
              ),
            ])),
        ),
      ],
      child: FutureBuilder<SharedPreferences>(
        future: SharedPreferences.getInstance(),
        builder: (context, snapshot) {
          final initialRoute = snapshot.data?.getString('token') != null
              ? UserScreen.routename
              : LoginScreen.routename;

          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: theme(),
            onGenerateRoute: RouteGenerator.generateRoute,
            initialRoute: initialRoute,
          );
        },
      ),
    );
  }
}
