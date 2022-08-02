import 'package:flutter/material.dart';
import 'package:open_vacancies/src/screens/create_profile_screen.dart';
import 'package:open_vacancies/src/screens/sign_in_screen.dart';
import 'package:open_vacancies/src/screens/sign_up_screen.dart';

class Root extends StatelessWidget {
  const Root({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SignUpScreen(),
      routes: {
        '/signIn': (context) => SignInScreen(),
        '/signUp': (context) => SignUpScreen(),
        '/createProfile': (context) => CreateProfileScreen(),
      },
    );
  }
}
