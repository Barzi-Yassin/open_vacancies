import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:open_vacancies/src/screens/create_profile_screen.dart';
import 'package:open_vacancies/src/screens/sign_in_screen.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final myController = TextEditingController();

  final myController2 = TextEditingController();

//Loading logic
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading == true
          ? LinearProgressIndicator()
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 200),
                      child: Container(
                          height: 40,
                          width: 100,
                          decoration: BoxDecoration(color: Colors.grey),
                          child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SignInScreen()));
                              },
                              child: Text(
                                "Login",
                                style: TextStyle(color: Colors.white),
                              ))),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "REGISTER",
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
                            borderSide:
                                BorderSide(width: 0, style: BorderStyle.none),
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
                        controller: myController2,
                        obscureText: true,
                        enableSuggestions: false,
                        autocorrect: false,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide:
                                BorderSide(width: 0, style: BorderStyle.none),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                        height: 50,
                        width: 100,
                        decoration: BoxDecoration(color: Colors.grey),
                        child: TextButton(
                            onPressed: () async {
                              // Navigator.of(context).pushNamed('/createProfile');
                              setState(() {
                                _isLoading = true;
                              });

                              await push(context, myController, myController2);

                              setState(() {
                                _isLoading = false;
                              });

                              //_isLoading = false;
                            },
                            child: Text(
                              "Sign Up",
                              style: TextStyle(color: Colors.white),
                            )))
                  ],
                )
              ],
            ),
    );
  }
}

Future<User?> push(
    BuildContext context, final myController3, final myController4) async {
  RegExp emailRegExp = RegExp(
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
  if (myController3.text == "" || myController4.text == "") {
    showAlertDialog(context, "Please enter the required information");
  } else if (!emailRegExp.hasMatch(myController3.text)) {
    return showAlertDialog(context, "Enter a vaild Email");
  } else {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: myController3.text,
        password: myController4.text,
      );
      delayPushSignup(context: context, userCredential: userCredential);
      user = userCredential.user;

      await user?.reload();
      user = auth.currentUser;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showAlertDialog(context, "The password provided is too weak.");
      } else if (e.code == 'email-already-in-use') {
        showAlertDialog(context, 'The account already exists for that email.');
      }
    } catch (e) {
      showAlertDialog(context, e.toString());
    }
    return user;
  }
}

Future delayPushSignup(
    {required BuildContext context,
    required UserCredential userCredential}) async {
  await Future.delayed(Duration(milliseconds: 10), () {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) => CreateProfileScreen(
                user: userCredential.user,
              )),
    );
  });
}
