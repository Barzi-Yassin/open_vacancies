import 'package:flutter/material.dart';
import 'package:open_vacancies/src/screens/create_profile_screen.dart';
import 'package:open_vacancies/src/screens/sign_up_screen.dart';

class Root extends StatelessWidget {
  const Root({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CreateProfileScreen(),
    );
  }
}
