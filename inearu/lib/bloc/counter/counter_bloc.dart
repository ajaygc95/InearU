import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:inearu/bloc/counter/counter_event.dart';
import 'package:inearu/bloc/counter/counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  int counter = 0;
  CounterBloc() : super(InitialCounterState()) {
    on<NumberIncreaseEvent>(onNumberIncrease);
    on<NumberDecreaseEvent>(onNumberDecrease);
  }

  void onNumberIncrease(
      NumberIncreaseEvent event, Emitter<CounterState> emit) async {
    counter = counter + 1;
    emit((UpdateCounter(counter)));
  }

  void onNumberDecrease(
      NumberDecreaseEvent event, Emitter<CounterState> emit) async {
    if (counter > 0) {
      counter = counter - 1;
      emit((UpdateCounter(counter)));
    }
  }
}
