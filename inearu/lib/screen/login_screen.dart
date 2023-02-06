import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inearu/bloc/login/login_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends StatelessWidget {
  static const String routename = '/loginscreen';

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 216, 216, 216),
      body: SingleChildScrollView(
        child: SafeArea(
          child: BlocBuilder<LoginBloc, LoginState>(
            builder: (context, state) {
              if (state is LoginSuccess) {
                _getUserIdFromSharedPrefs(context);
              } else {
                return _loginForm(context);
              }

              return _loginForm(context);
            },
          ),
        ),
      ),
    );
  }

  Padding _loginForm(BuildContext context) {
    final _usernameController = TextEditingController();
    final _passwordController = TextEditingController();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 50),

            // Logo
            Icon(Icons.lock, size: 100),
            SizedBox(height: 40),
            Text(
              'Welcome back you\'ve been missed',
              style: TextStyle(color: Colors.grey[700], fontSize: 16),
            ),

            SizedBox(height: 25),
            // Username
            _usernameField(_usernameController),

            SizedBox(height: 10),

            // Password
            _passwordField(_passwordController),

            const SizedBox(height: 15),
            // FOrgot Password
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/userscreen');
                  },
                  child: Text(
                    "Forgot Password?",
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            // LoginButton
            _loginButton(context, _usernameController, _passwordController),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Not a member? "),
                Text(
                  "Register Now",
                  style: TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.bold),
                )
              ],
            ),
            // Divider
            SizedBox(height: 20),
            const _divider(),
            SizedBox(height: 20),
            // Google / facebook
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _socialLogo(
                  icon: FontAwesomeIcons.google,
                  color: Color(0xFFDB4437),
                ),
                SizedBox(
                  width: 40,
                ),
                _socialLogo(
                  icon: FontAwesomeIcons.facebook,
                  color: Color(0xFF3B5998),
                ),
                SizedBox(
                  width: 40,
                ),
                _socialLogo(
                  icon: FontAwesomeIcons.apple,
                  color: Colors.black,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _usernameField(TextEditingController usernameController) {
    return TextFormField(
      controller: usernameController,
      decoration: InputDecoration(
        hintText: "email",
        hintStyle: TextStyle(color: Colors.grey[500]),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 255, 255, 255)),
        ),
        fillColor: Colors.grey.shade200,
        filled: true,
      ),
      validator: (value) => null,
    );
  }

  Widget _passwordField(TextEditingController passwordController) {
    return TextFormField(
      controller: passwordController,
      obscureText: true,
      decoration: InputDecoration(
        hintText: "password",
        hintStyle: TextStyle(color: Colors.grey[500]),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        fillColor: Colors.grey.shade200,
        filled: true,
      ),
      validator: (value) => null,
    );
  }

  Widget _loginButton(
      BuildContext context,
      TextEditingController usernameController,
      TextEditingController passwordController) {
    return GestureDetector(
      onTap: () {
        BlocProvider.of<LoginBloc>(context).add(
          LoginButtonPressed(
            username: usernameController.text,
            password: passwordController.text,
          ),
        );
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.black,
        ),
        child: Center(
          child: Text(
            "Sign In",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  void _getUserIdFromSharedPrefs(BuildContext context) async {
    final sharedPrefs = await SharedPreferences.getInstance();
    final token = sharedPrefs.getString('token');

    Navigator.of(context).pushNamed('/apiprofileScreen', arguments: token);
  }
}

class _socialLogo extends StatelessWidget {
  final Color color;
  final IconData icon;
  const _socialLogo({
    Key? key,
    required this.icon,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        border: Border.all(
          color: Colors.white,
          width: 2.0,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(8.0),
        ),
      ),
      child: Icon(
        icon,
        size: 50,
        color: color,
      ),
    );
  }
}

class _divider extends StatelessWidget {
  const _divider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            thickness: 1,
            color: Colors.grey[500],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Text("Or continue with"),
        ),
        Expanded(
          child: Divider(
            thickness: 1,
            color: Colors.grey[500],
          ),
        ),
      ],
    );
  }
}
