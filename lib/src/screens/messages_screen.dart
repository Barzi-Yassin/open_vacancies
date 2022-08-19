import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:open_vacancies/src/screens/home_screen.dart';

class MessagesScreenView extends StatelessWidget {
  const MessagesScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'open vacancies'.toUpperCase(),
          style: const TextStyle(fontSize: 25),
        ),
        actions: [
          IconButton(
              onPressed: () => FirebaseAuth.instance.signOut(),
              icon: Icon(Icons.logout)),
        ],
      ),
      body: Container(
        width: double.infinity,
        color: Colors.white,
        child: Column(
          children: [
            // header section

            // body section
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return const OutputContainerWidget(
                    userName: "username",
                    company: "company",
                    roleDescription: "role descriptiion",
                    url: 'https://www.google.com/',
                  );
                },
              ),
            ),
            // inputs section
            const Divider(
              color: Colors.black26,
              height: 2,
              thickness: 1,
            ),
            Container(
              height: 240,
              width: double.maxFinite,
              decoration: const BoxDecoration(
                color: Colors.transparent,
              ),
              margin: const EdgeInsets.only(top: 10),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: double.infinity,
                    height: 230,
                    margin: const EdgeInsets.symmetric(horizontal: 22.0),
                    child: Column(
                      children: [
                        const InputContainer(hintText: 'company/org'),
                        const InputContainer(hintText: 'role'),
                        const InputContainer(hintText: 'Url'),
                        Container(
                          // color: Colors.yellow,
                          height: 40,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.lightBlue.shade50,
                            border: Border.all(
                              color: Colors.blue,
                              width: 1,
                            ),
                          ),
                          child: TextButton(
                            onPressed: () {},
                            child: const Text(
                              'SEND',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.blue,
                                letterSpacing: 1,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
