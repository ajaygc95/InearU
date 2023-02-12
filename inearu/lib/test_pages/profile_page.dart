import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inearu/bloc/profile/profile_bloc.dart';
import 'package:inearu/bloc/profile/profile_event.dart';
import 'package:inearu/bloc/profile/profile_state.dart';

class TestProfileScreen extends StatelessWidget {
  static const String routename = '/testprofilescreen';
  const TestProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: BlocBuilder<ProfileBloc, ProfileState>(
            builder: (context, state) {
              if (state is InitialProfileState) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _upperProfileColumn(
                        name: state.profile.name,
                        age: state.profile.age,
                        firstName: state.profile.firstName,
                        lastName: state.profile.lastName,
                        jobTitle: state.profile.jobTitle,
                        bio: state.profile.bio,
                        imageUrls: state.profile.imageUrls,
                        interests: state.profile.interests),
                    _lowerScreenColumn(),
                  ],
                );
              } else if (state is UpdateProfileState) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _upperProfileColumn(
                        name: state.profile.name,
                        age: state.profile.age,
                        firstName: state.profile.firstName,
                        lastName: state.profile.lastName,
                        jobTitle: state.profile.jobTitle,
                        bio: state.profile.bio,
                        imageUrls: state.profile.imageUrls,
                        interests: state.profile.interests),
                    _lowerScreenColumn(),
                  ],
                );
              } else {
                return Text("Enter your info");
              }
            },
          ),
        ),
      ),
    );
  }
}

class _lowerScreenColumn extends StatelessWidget {
  const _lowerScreenColumn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      child: Column(
        children: [
          _inputFields(name: "name"),
          SizedBox(height: 10),
          _inputFields(name: "first_name"),
          SizedBox(height: 10),
          _inputFields(name: "last_name"),
          SizedBox(height: 10),
          _inputFields(name: "age"),
          SizedBox(height: 10),
          _inputFields(name: "bio"),
          SizedBox(height: 10),
          _inputFields(name: "jobTitle"),
          SizedBox(height: 10),
          _inputFields(name: "imageUrls"),
          SizedBox(height: 10),
          _inputFields(name: "interests"),
          SizedBox(height: 10),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 18),
            decoration: BoxDecoration(
              color: Colors.purple,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Center(
              child: InkWell(
                onTap: () {},
                child: Text(
                  "Submit",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _inputFields extends StatelessWidget {
  final String name;
  const _inputFields({
    Key? key,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: name,
        hintText: "Enter your $name",
      ),
      onChanged: (value) {
        BlocProvider.of<ProfileBloc>(context)
            .add(UpdateProfileEvent(label: "$name", value: value));
      },
    );
  }
}

class _upperProfileColumn extends StatelessWidget {
  final String name;
  final int age;
  final String firstName;
  final String lastName;
  final String jobTitle;
  final String bio;
  final List<String> imageUrls;
  final List interests;

  const _upperProfileColumn({
    Key? key,
    required this.name,
    required this.age,
    required this.firstName,
    required this.lastName,
    required this.jobTitle,
    required this.bio,
    required this.imageUrls,
    required this.interests,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Name: $name", style: TextStyle(fontSize: 16)),
          Text("Age: $age", style: TextStyle(fontSize: 16)),
          Text("First Name: $firstName", style: TextStyle(fontSize: 16)),
          Text("Last Name: $lastName", style: TextStyle(fontSize: 16)),
          Text("Job Title: $jobTitle", style: TextStyle(fontSize: 16)),
          Text("Bio: $bio", style: TextStyle(fontSize: 16)),
          Text("ImageUrls: $imageUrls", style: TextStyle(fontSize: 16)),
          Text("Interests: $interests", style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
