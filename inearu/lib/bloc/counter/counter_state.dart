class CounterState {}

class InitialCounterState extends CounterState {}

class UpdateCounter extends CounterState {
  final int counter;

  UpdateCounter(this.counter);
}
