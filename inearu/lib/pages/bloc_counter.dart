import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inearu/bloc/counter/counter_bloc.dart';
import 'package:inearu/bloc/counter/counter_event.dart';
import 'package:inearu/bloc/counter/counter_state.dart';

class CounterScreen extends StatelessWidget {
  static const String routename = '/counterscreen';
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<CounterBloc, CounterState>(
          builder: (context, state) {
            return Row(
              children: [
                InkWell(
                    onTap: () => BlocProvider.of<CounterBloc>(context)
                        .add(NumberDecreaseEvent()),
                    child: CircleAvatar(child: Icon(Icons.remove))),
                // Text(state is UpdateCounter ? "${state.counter}" : "0"),
                InkWell(
                    onTap: () => BlocProvider.of<CounterBloc>(context)
                        .add(NumberIncreaseEvent()),
                    child: CircleAvatar(child: Icon(Icons.add))),
              ],
            );
          },
        ),
      ),
    );
  }
}
