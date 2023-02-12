import 'package:inearu/models/test_profile.dart';

class CounterState {}

class InitialCounterState extends CounterState {}

class UpdateCounter extends CounterState {
  final TestProfile profile;

  UpdateCounter({required this.profile});
}
