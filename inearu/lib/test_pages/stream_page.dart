import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inearu/bloc/counter/counter_bloc.dart';
import 'package:inearu/bloc/counter/counter_event.dart';
import 'package:inearu/bloc/counter/counter_state.dart';

class StreamScreen extends StatelessWidget {
  static const String routename = '/streamscreen';
  const StreamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade400,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) {
                if (state is InitialCounterState) {
                  return _counterText(value: "0");
                } else if (state is UpdateCounter) {
                  return Row(
                    children: [
                      _counterText(value: "${state.profile.name}"),
                      _counterText(value: "${state.profile.age}"),
                    ],
                  );
                } else {
                  return _counterText(value: "There is something wrong");
                }
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  onPressed: () {
                    BlocProvider.of<CounterBloc>(context)
                        .add(NumberDecreaseEvent());
                  },
                  child: Icon(
                    Icons.remove,
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<CounterBloc>(context)
                        .add(NumberIncreaseEvent());
                  },
                  child: Icon(Icons.add),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Center _streambuilder() {
    return Center(
      child: StreamBuilder(
        stream: streamData(5),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Text(
              " Hello ${snapshot.data}",
              style: TextStyle(fontSize: 50),
            );
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }

  Stream<int> streamData(int n) async* {
    for (int i = 0; i <= n; i++) {
      await Future.delayed(Duration(milliseconds: 200));
      yield i;
    }
  }
}

class _counterText extends StatelessWidget {
  final String value;
  const _counterText({
    Key? key,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(80),
        gradient: LinearGradient(
          colors: [
            Colors.white,
            Colors.red,
            Colors.amber,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Center(
        child: Text(
          value,
          style: TextStyle(
              fontSize: 40, color: Color.fromARGB(255, 237, 234, 234)),
        ),
      ),
    );
  }
}
