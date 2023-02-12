import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:inearu/bloc/counter/counter_event.dart';
import 'package:inearu/bloc/counter/counter_state.dart';
import 'package:inearu/models/test_profile.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  TestProfile profile = TestProfile(name: "", age: 1);
  CounterBloc() : super(InitialCounterState()) {
    on<NumberIncreaseEvent>(onNumberIncrease);
    on<NumberDecreaseEvent>(onAddAge);
  }

  void onNumberIncrease(
      NumberIncreaseEvent event, Emitter<CounterState> emit) async {
    profile.name = "Ajay";
    emit((UpdateCounter(profile: profile)));
  }

  void onAddAge(NumberDecreaseEvent event, Emitter<CounterState> emit) async {
    profile.age = 27;
    emit((UpdateCounter(profile: profile)));
  }
}
