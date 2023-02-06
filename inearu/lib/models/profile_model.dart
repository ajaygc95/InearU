class ProfileModel {
  int id;
  int user;
  String firstName;
  String lastName;
  String jobTitle;
  String bio;
  List<String> imageUrls;
  List interests;

  ProfileModel({
    required this.id,
    required this.user,
    required this.firstName,
    required this.lastName,
    required this.jobTitle,
    required this.bio,
    required this.imageUrls,
    required this.interests,
  });

  List<ProfileModel> profiles = [];

  ProfileModel copyWith({
    required int id,
    required int user,
    required String firstName,
    required String lastName,
    required String jobTitle,
    required String bio,
    required List<String> imageUrls,
    required List interests,
  }) {
    return ProfileModel(
      id: id,
      user: user,
      firstName: firstName,
      lastName: lastName,
      jobTitle: jobTitle,
      bio: bio,
      imageUrls: imageUrls,
      interests: interests,
    );
  }
}
