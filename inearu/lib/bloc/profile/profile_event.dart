part of 'profile_bloc.dart';

@immutable
abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class LoadProfile extends ProfileEvent {
  final List<ProfileModel> profiles;

  const LoadProfile({this.profiles = const <ProfileModel>[]});

  @override
  List<Object> get props => [profiles];
}

class AddProfile extends ProfileEvent {
  final ProfileModel profile;

  const AddProfile({required this.profile});
  @override
  List<Object> get props => [profile];
}

class UpdateProfile extends ProfileEvent {
  final ProfileModel profile;

  const UpdateProfile({required this.profile});
  @override
  List<Object> get props => [profile];
}

class DeleteProfile extends ProfileEvent {
  final ProfileModel profile;

  const DeleteProfile({required this.profile});
  @override
  List<Object> get props => [profile];
}
