// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_field, prefer_final_fields

import 'package:dropdown_button2/custom_dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_radio_group/flutter_radio_group.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class CreateProfileScreen extends StatelessWidget {
  const CreateProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            SizedBox(
              height: 90,
            ),
            NameField(),
            SizedBox(
              height: 8,
            ),
            PhoneField(),
            SizedBox(
              height: 8,
            ),
            CityField(),
            SizedBox(
              height: 8,
            ),
            JobCatagory(),
            RadioGroup(),
            CreateButton()
          ],
        ),
      )),
    );
  }
}

class NameField extends StatelessWidget {
  const NameField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (Column(
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
              obscureText: false,
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                filled: true,
              ),
            ),
          ),
        )
      ],
    ));
  }
}

class PhoneField extends StatelessWidget {
  const PhoneField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (Column(
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
              obscureText: false,
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                filled: true,
              ),
            ),
          ),
        )
      ],
    ));
  }
}

class CityField extends StatefulWidget {
  const CityField({Key? key}) : super(key: key);

  @override
  State<CityField> createState() => _CityFieldState();
}

class _CityFieldState extends State<CityField> {
  final List<String> cities = [
    'Erbil',
    'Slemany',
    'Duhok',
    'Halabja',
  ];
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    initState() {
      super.initState();
      selectedValue = cities[0];
    }

    return (Column(
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
                      border:
                          Border.all(color: Color.fromARGB(255, 124, 124, 124)),
                      color: Color.fromARGB(255, 237, 237, 237)),
                  dropdownItems: cities,
                  value: selectedValue,
                  onChanged: (value) {
                    setState(() {
                      selectedValue = value;
                      debugPrint(selectedValue!);
                    });
                  },
                )))
      ],
    ));
  }
}

class JobCatagory extends StatefulWidget {
  const JobCatagory({Key? key}) : super(key: key);

  @override
  State<JobCatagory> createState() => _JobCatagoryState();
}

class _JobCatagoryState extends State<JobCatagory> {
  final List<String> jobs = [
    'Flutter Developer',
    'fullstack developer',
    'web developer',
    'chief executive officer',
  ];
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    return (Column(
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
                hint: 'select city',
                buttonDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border:
                        Border.all(color: Color.fromARGB(255, 124, 124, 124)),
                    color: Color.fromARGB(255, 237, 237, 237)),
                dropdownItems: jobs,
                value: selectedValue,
                onChanged: (value) {
                  setState(() {
                    selectedValue = value;
                    debugPrint(selectedValue!);
                  });
                },
              )),
        )
      ],
    ));
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

class CreateButton extends StatelessWidget {
  const CreateButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(200, 30, 0, 0),
      child: (ElevatedButton(onPressed: () {}, child: Text('Create Profile'))),
    );
  }
}
