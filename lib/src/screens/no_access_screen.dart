import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class NoAccessScreenView extends StatelessWidget {
  const NoAccessScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      // to avoid going back a level
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                  'You don\'t have access to this screen please register or login'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      onPressed: () =>
                          Navigator.pushReplacementNamed(context, '/signIn'),
                      child: Text('Sign in')),
                  ElevatedButton(
                      onPressed: () =>
                          Navigator.pushReplacementNamed(context, '/signUp'),
                      child: Text('Sign up'))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
