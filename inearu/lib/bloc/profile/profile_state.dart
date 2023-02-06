part of 'profile_bloc.dart';

@immutable
abstract class ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final List<ProfileModel> profiles;

  ProfileLoaded({this.profiles = const <ProfileModel>[]});

  @override
  List<Object> get props => [profiles];
}


