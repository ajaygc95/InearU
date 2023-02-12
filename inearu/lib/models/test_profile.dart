import 'package:equatable/equatable.dart';

class TestProfile extends Equatable {
  String email;
  String name;
  int age;
  String firstName;
  String lastName;
  String jobTitle;
  String bio;
  List<String> imageUrls;
  List interests;

  TestProfile({
    this.email = '',
    this.name = '',
    this.age = 0,
    this.firstName = '',
    this.lastName = '',
    this.jobTitle = '',
    this.bio = '',
    this.imageUrls = const [],
    this.interests = const [],
  });

  @override
  // TODO: implement props
  List<Object?> get props =>
      [email, name, age, firstName, lastName, jobTitle, bio];

  TestProfile copyWith({
    String? email,
    String? name,
    int? age,
    String? firstName,
    String? bio,
    String? lastName,
    String? jobTitle,
    List<String>? imageUrls,
    List? interests,
  }) {
    return TestProfile(
      email: email ?? this.email,
      name: name ?? this.name,
      age: age ?? this.age,
      bio: bio ?? this.bio,
      firstName: firstName ?? this.firstName,
      imageUrls: imageUrls ?? this.imageUrls,
      jobTitle: jobTitle ?? this.jobTitle,
      lastName: lastName ?? this.lastName,
      interests: interests ?? this.interests,
    );
  }
}
