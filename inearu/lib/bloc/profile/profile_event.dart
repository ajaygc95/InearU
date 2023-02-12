import 'package:equatable/equatable.dart';

abstract class ProfileEvent {}

class UpdateProfileEvent extends ProfileEvent {
  final String label;
  final dynamic value;

  UpdateProfileEvent({required this.label, required this.value});
}
