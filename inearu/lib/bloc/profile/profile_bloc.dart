import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:inearu/models/profile_model.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileLoading()) {
    on<LoadProfile>(_onLoadProfiles);
    on<AddProfile>(_onAddProfile);
    on<UpdateProfile>(_onUpdateProfile);
    on<DeleteProfile>(_onDeleteProfile);
  }
  void _onLoadProfiles(LoadProfile event, Emitter<ProfileState> emit) {
    emit(
      ProfileLoaded(profiles: event.profiles),
    );
  }

  void _onAddProfile(AddProfile event, Emitter<ProfileState> emit) {
    final state = this.state;

    if (state is ProfileLoaded) {
      emit(
        ProfileLoaded(
          profiles: List.from(state.profiles)..add(event.profile),
        ),
      );
    }
  }

  void _onUpdateProfile(UpdateProfile event, Emitter<ProfileState> emit) {}
  void _onDeleteProfile(DeleteProfile event, Emitter<ProfileState> emit) {}
}
