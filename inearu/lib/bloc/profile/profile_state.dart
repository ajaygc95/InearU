import 'package:inearu/models/test_profile.dart';

class ProfileState {}

class InitialProfileState extends ProfileState {
  final TestProfile profile = TestProfile();
}

class UpdateProfileState extends ProfileState {
  final TestProfile profile;

  UpdateProfileState({required this.profile});
}


// class UpdateProfileState {
//   final String name;

//   UpdateProfileState({required this.name});

//   ProfileState update(ProfileState currentState) {
//     return ProfileState(
//       name: name,
//       age: currentState.age,
//     );
//   }
// }
