import 'package:bloc/bloc.dart';
import 'package:inearu/bloc/profile/profile_event.dart';
import 'package:inearu/bloc/profile/profile_state.dart';
import 'package:inearu/models/test_profile.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  TestProfile profile = TestProfile();
  ProfileBloc() : super(InitialProfileState()) {
    on<UpdateProfileEvent>(onNumberIncrease);
  }

  void onNumberIncrease(ProfileEvent event, Emitter<ProfileState> emit) async {
    if (event is UpdateProfileEvent) {
      if (event.label == "name") {
        print("${event.value}");
        profile = profile.copyWith(name: event.value);
      } else if (event.label == "age") {
        profile = profile.copyWith(age: int.parse(event.value));
      } else if (event.label == "first_name") {
        profile = profile.copyWith(firstName: event.value);
      } else if (event.label == "last_name") {
        profile = profile.copyWith(lastName: event.value);
      } else if (event.label == "bio") {
        profile = profile.copyWith(bio: event.value);
      } else if (event.label == "jobTitle") {
        profile = profile.copyWith(jobTitle: event.value);
      }
    }

    emit(UpdateProfileState(profile: profile));
  }
}
