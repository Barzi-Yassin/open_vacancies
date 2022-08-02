import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:open_vacancies/src/screens/messages_screen.dart';
import 'package:open_vacancies/src/screens/no_access_screen.dart';
import 'package:url_launcher/url_launcher_string.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            }
            print(snapshot.data.toString());

            //TODO: if the user is logged in return the messages screen
            if (snapshot.data == null) {
              return NoAccessScreenView();
            } else {
              return MessagesScreenView();
            }
            //TODO: if the user isnt logged in return that you don't have access please login
          }),
    );
  }
}

class InputContainer extends StatelessWidget {
  const InputContainer({
    Key? key,
    required this.hintText,
  }) : super(key: key);

  final String hintText;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.grey.shade100,
        border: Border.all(
          color: Colors.blue,
          width: 0.8,
        ),
      ),
      width: double.infinity,
      height: 50,
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.only(left: 15),
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: '${hintText.toUpperCase()}:',
        ),
      ),
    );
  }
}

class OutputContainerWidget extends StatelessWidget {
  const OutputContainerWidget({
    Key? key,
    required this.userName,
    required this.company,
    required this.roleDescription,
    required this.url,
  }) : super(key: key);

  final String userName;
  final String company;
  final String roleDescription;
  final String url;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.grey.shade100,
        border: Border.all(
          color: Colors.blue.shade200,
          width: 1.50,
        ),
      ),
      width: double.infinity,
      height: 130,
      margin: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 8.0),
      alignment: Alignment.center,
      //  inside_box_messages-column
      child: Column(
        children: [
          Container(
            width: double.infinity,
            margin: const EdgeInsets.fromLTRB(15.0, 12.0, 15.0, 8.0),
            child: Text(
              // 'username'.toUpperCase(),
              userName.toUpperCase(),
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 8.0),
            child: Text(
              // 'company'.toUpperCase(),
              company.toUpperCase(),
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 30.0),
            child: Text(
              // 'role description'.toUpperCase(),
              roleDescription.toUpperCase(),
              style: const TextStyle(
                  color: Colors.grey, fontSize: 11, height: 1.4),
              textAlign: TextAlign.start,
              maxLines: 3,
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.only(right: 15),
            // color: Colors.red,
            child: InkWell(
              child: Text(
                'LINK',
                style: TextStyle(color: Colors.blue.shade300),
              ),
              onTap: () {
                launchUrlString(url);
              },
            ),
          ),
        ],
      ),
    );
  }
}
