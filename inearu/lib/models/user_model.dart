class User {
  final String name;
  final int id;
  final String firstName;
  final String lastName;
  final int age;
  final List<String> imageUrls;
  final String bio;
  final String jobTitle;

  User({
    required this.name,
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.age,
    required this.imageUrls,
    required this.bio,
    required this.jobTitle,
  });
  List<Object?> get props =>
      [id, name, firstName, lastName, age, imageUrls, bio, jobTitle];

  static final List<User> users = [
    User(
        name: 'Ajay Doe',
        id: 1,
        firstName: 'Ajay',
        lastName: 'GC',
        age: 27,
        imageUrls: [
          'https://images.unsplash.com/photo-1663024718100-9250a83a1db5?ixlib=rb-1.2.1&ixid=Mn',
          'https://images.unsplash.com/photo-1663017933548-6692e8e0518d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx',
          'https://images.unsplash.com/photo-1540174401473-df5f1c06c716?ixlib=rb-4.0.3&ixid=Mn',
        ],
        bio:
            'Software Engineer with 5 years of experience in developing web and mobile applications',
        jobTitle: 'Software Engineer'),
    User(
        name: 'Jane Smith',
        id: 2,
        firstName: 'Jane',
        lastName: 'Smith',
        age: 25,
        imageUrls: [
          'https://images.unsplash.com/photo-1663017933548-6692e8e0518d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx',
          'https://images.unsplash.com/photo-1558981852-426c6c22a060?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'
        ],
        bio:
            'Graphic Designer with 3 years of experience in creating visual concepts',
        jobTitle: 'Graphic Designer'),
    User(
        name: 'Natalia Korpal',
        id: 3,
        firstName: 'Natalia',
        lastName: 'Korpal',
        age: 25,
        imageUrls: [
          'https://images.unsplash.com/photo-1540174401473-df5f1c06c716?ixlib=rb-4.0.3&ixid=Mn',
          'https://images.unsplash.com/photo-1558981852-426c6c22a060?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'
        ],
        bio:
            'Graphic Designer with 3 years of experience in creating visual concepts',
        jobTitle: 'Graphic Designer'),
    User(
        name: 'Suraj Gurung',
        id: 4,
        firstName: 'Suraj',
        lastName: 'Gurung',
        age: 25,
        imageUrls: [
          'https://images.unsplash.com/photo-1540174401473-df5f1c06c716?ixlib=rb-4.0.3&ixid=Mn',
          'https://images.unsplash.com/photo-1558981852-426c6c22a060?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'
        ],
        bio:
            'Graphic Designer with 3 years of experience in creating visual concepts',
        jobTitle: 'Graphic Designer'),
    User(
        name: 'Kushal Khatri',
        id: 5,
        firstName: 'Kushal ',
        lastName: 'Khatri',
        age: 25,
        imageUrls: [
          'https://images.unsplash.com/photo-1540174401473-df5f1c06c716?ixlib=rb-4.0.3&ixid=Mn',
          'https://images.unsplash.com/photo-1558981852-426c6c22a060?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'
        ],
        bio:
            'Graphic Designer with 3 years of experience in creating visual concepts',
        jobTitle: 'Graphic Designer'),
  ];
}
