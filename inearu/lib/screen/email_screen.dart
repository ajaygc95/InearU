import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inearu/bloc/profile/profile_bloc.dart';
import 'package:inearu/bloc/profile/profile_event.dart';
import 'package:inearu/bloc/profile/profile_state.dart';
import 'package:inearu/widgets/widgets.dart';

class Email extends StatelessWidget {
  final TabController tabController;
  const Email({super.key, required this.tabController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              CustomTextHeader(
                  tabController: tabController,
                  text: "Enter Your Email Address."),
              BlocBuilder<ProfileBloc, ProfileState>(
                builder: (context, state) {
                  return _inputFields(name: 'name');
                },
              ),
            ],
          ),
          InkWell(
              onTap: () {
                Navigator.pushNamed(context, "/testprofilescreen");
              },
              child: Text("Press me")),
          CustomBotton(tabController: tabController, text: 'Next Step'),
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
