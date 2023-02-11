import 'package:bloc/bloc.dart';

class CounterCubitBloc extends Cubit<int> {
  CounterCubitBloc(int intialState) : super(intialState);
  void increment() => emit(state + 1);
  void decrement() => emit(state - 1);
}
