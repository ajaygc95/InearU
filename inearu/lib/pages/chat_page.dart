import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inearu/bloc/profile/profile_bloc.dart';
import 'package:inearu/cubit/cubit/counter_cubit.dart';
import 'package:inearu/models/profile_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatPage extends StatefulWidget {
  static const String routename = '/randomtest';
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.amber),
      ),
      body: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          if (state is ProfileLoading) {
            return const CircularProgressIndicator();
          }
          if (state is ProfileLoaded) {
            return Container(
              child: ListView.builder(
                  itemCount: state.profiles.length,
                  shrinkWrap: true,
                  itemBuilder: ((context, index) {
                    return Text(
                      state.profiles[index].firstName,
                      style: TextStyle(color: Colors.amberAccent, fontSize: 30),
                    );
                  })),
            );
          } else {
            return const Text("Something went wrong");
          }
        },
      ),
    );
  }
}
