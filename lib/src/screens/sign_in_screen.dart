import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

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
                      onPressed: () {},
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
