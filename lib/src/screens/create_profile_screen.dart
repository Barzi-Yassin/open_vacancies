import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_button2/custom_dropdown_button2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_radio_group/flutter_radio_group.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:open_vacancies/src/screens/home_screen.dart';

class CreateProfileScreen extends StatefulWidget {
  CreateProfileScreen({Key? key, this.user}) : super(key: key);
  final User? user;

  @override
  State<CreateProfileScreen> createState() => _CreateProfileScreenState();
}

class _CreateProfileScreenState extends State<CreateProfileScreen> {
  String? _selectedCity;
  String? _selectedJob;

  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _phoneNumberController = TextEditingController();

  @override
  void initState() {
    debugPrint('init');
    _selectedCity = cities[0];
    _selectedJob = jobs[0];

    // TODO: implement initState
    super.initState();
  }

  final List<String> cities = [
    'Erbil',
    'Slemany',
    'Duhok',
    'Halabja',
  ];

  final List<String> jobs = [
    'Flutter Developer',
    'fullstack developer',
    'web developer',
    'chief executive officer',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            Text('${widget.user}'),
            SizedBox(
              height: 90,
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 240, 0),
                  child: Text(
                    'Name',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                  child: Container(
                    height: 50,
                    child: TextField(
                      controller: _nameController,
                      obscureText: false,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        filled: true,
                      ),
                    ),
                  ),
                )
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 240, 0),
                  child: Text(
                    'Phone',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                  child: Container(
                    height: 50,
                    child: TextField(
                      controller: _phoneNumberController,
                      obscureText: false,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        filled: true,
                      ),
                    ),
                  ),
                )
              ],
            ),

            SizedBox(
              height: 8,
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 255, 0),
                  child: Text(
                    'City',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                    child: Container(
                        height: 50,
                        child: CustomDropdownButton2(
                          buttonWidth: 300,
                          hint: 'select city',
                          buttonDecoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: Color.fromARGB(255, 124, 124, 124)),
                              color: Color.fromARGB(255, 237, 237, 237)),
                          dropdownItems: cities,
                          value: _selectedCity,
                          onChanged: (value) {
                            setState(() {
                              _selectedCity = value;
                              debugPrint(_selectedCity!);
                            });
                          },
                        )))
              ],
            ),

            // PhoneField(),

            SizedBox(
              height: 8,
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 220, 0),
                  child: Text(
                    'Job Category',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                  child: Container(
                      height: 50,
                      child: CustomDropdownButton2(
                        buttonWidth: 300,
                        hint: 'select job',
                        buttonDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: Color.fromARGB(255, 124, 124, 124)),
                            color: Color.fromARGB(255, 237, 237, 237)),
                        dropdownItems: jobs,
                        value: _selectedJob,
                        onChanged: (value) {
                          setState(() {
                            _selectedJob = value;
                            debugPrint(_selectedJob!);
                          });
                        },
                      )),
                )
              ],
            ),

            // RadioGroup(),
            Padding(
              padding: const EdgeInsets.fromLTRB(200, 30, 0, 0),
              child: (ElevatedButton(
                  onPressed: () {
                    //TODO: on users collection > create a document and id it> get the id from the constructor >
                    // fill the document with the user data from this field
                    if (widget.user != null) {
                      FirebaseFirestore.instance
                          .collection('users')
                          .doc(widget.user!.uid)
                          .set({
                        "name": _nameController.text,
                        "phone": _phoneNumberController.text,
                        "city": _selectedCity,
                        "job_category": _selectedJob,
                        "email": widget.user!.email,
                        "uid": widget.user!.uid
                      });
                    }
                  },
                  child: Text('Create Profile'))),
            ),
          ],
        ),
      )),
    );
  }
}

class RadioGroup extends StatefulWidget {
  RadioGroup({Key? key}) : super(key: key);

  @override
  State<RadioGroup> createState() => _RadioGroupState();
}

class _RadioGroupState extends State<RadioGroup> {
  var _list = ["Employeed", "Unemployeed"];

  var _indexHorizontal = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
      child: (FlutterRadioGroup(
          titles: _list,
          labelStyle: TextStyle(color: Colors.white38),
          labelVisible: true,
          activeColor: Color.fromARGB(255, 155, 10, 58),
          titleStyle: TextStyle(fontSize: 14),
          defaultSelected: _indexHorizontal,
          orientation: RGOrientation.VERTICAL,
          onChanged: (index) {
            setState(() {
              _indexHorizontal = index!;
            });
          })),
    );
  }
}
