import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:open_vacancies/src/screens/home_screen.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({Key? key}) : super(key: key);
  final myController = TextEditingController();
  final myController2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              SizedBox(
                height: 100,
              ),
              Text(
                "LOGIN",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
              SizedBox(
                height: 120,
              ),
              Container(
                height: 60,
                width: 300,
                decoration: BoxDecoration(color: Colors.grey),
                child: TextField(
                  controller: myController,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(width: 0, style: BorderStyle.none),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 60,
                width: 300,
                decoration: BoxDecoration(color: Colors.grey),
                child: TextField(
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                  controller: myController2,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(width: 0, style: BorderStyle.none),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 140.0),
                child: TextButton(
                    onPressed: () {}, child: Text("Forgot Your Password?")),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                  height: 50,
                  width: 100,
                  decoration: BoxDecoration(color: Colors.grey),
                  child: TextButton(
                      onPressed: () {
                        push(context, myController, myController2);
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(color: Colors.white),
                      )))
            ],
          )
        ],
      ),
    );
  }
}

Future push(
    BuildContext context, final myController, final myController2) async {
  RegExp emailRegExp = RegExp(
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");

  if (myController.text == "" || myController2.text == "") {
    showAlertDialog(context, "Please enter the required information");
  } else if (!emailRegExp.hasMatch(myController.text)) {
    return showAlertDialog(context, "Enter a vaild Email");
  } else {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: myController.text,
        password: myController2.text,
      );
      delayPushU(context);
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showAlertDialog(context, "No user found for that email.");
      } else if (e.code == 'wrong-password') {
        showAlertDialog(context, "Wrong password provided.");
      }
    }
  }
}

showAlertDialog(BuildContext context, String x) {
  // Create button
  Widget okButton = FlatButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Alert!"),
    content: Text(x),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

Future delayPushU(BuildContext context) async {
  await new Future.delayed(new Duration(milliseconds: 1500), () {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen()),
    );
  });
}
