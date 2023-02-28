import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:md_calculator/main.dart';
import 'package:md_calculator/pages/bmi_screen.dart';
import 'package:md_calculator/pages/gerd2.dart';
import 'package:md_calculator/pages/gerd_screen.dart';

class PatientScreen extends StatefulWidget {
  const PatientScreen({super.key});

  @override
  State<PatientScreen> createState() => _PatientScreenState();
}

String gender = "";
TextEditingController ageController = TextEditingController();
TextEditingController pnameController = TextEditingController();
final patientFormKey = GlobalKey<FormState>();

class _PatientScreenState extends State<PatientScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: patientFormKey,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20.0, horizontal: 20.0),
                    width: double.infinity,
                    height: 80.0,
                    decoration: const BoxDecoration(
                        color: Color(0xff1bb193),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10.0),
                            bottomRight: Radius.circular(10.0))),
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(
                              Icons.arrow_back_rounded,
                              color: Colors.white,
                              size: 28.0,
                            )),
                        Text(
                          "Patient Details",
                          style: GoogleFonts.roboto(
                            fontSize: 30.0,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            letterSpacing: 1.2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(bottom: 12.0, left: 5.0),
                            child: Text(
                              "Patient name",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Color.fromARGB(255, 115, 112, 112)),
                            ),
                          ),
                          TextFormField(
                            controller: pnameController,
                            keyboardType: TextInputType.name,
                            textCapitalization: TextCapitalization.words,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xff1bb193),
                                    ),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(20.0))),
                                alignLabelWithHint: false,
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 25.0, vertical: 25),
                                hintText: "eg. Michael J. Johnson"),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Enter patient's name";
                              } else if (!RegExp(
                                      r'^[A-Z][a-z]+([ ]?[A-Z]?[a-z]+)*$')
                                  .hasMatch(value)) {
                                return "Enter correct name format";
                              }
                            },
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(bottom: 12.0, left: 5.0),
                            child: Text(
                              "Age",
                              style: TextStyle(
                                fontSize: 18,
                                color: Color.fromARGB(255, 115, 112, 112),
                              ),
                            ),
                          ),
                          TextFormField(
                            controller: ageController,
                            keyboardType: TextInputType.number,
                            textCapitalization: TextCapitalization.words,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(20.0))),
                                alignLabelWithHint: false,
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 25.0, vertical: 25),
                                hintText: "eg. 18"),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "eg. Dr. Xyz";
                              } else if (!RegExp(r'^[1-9][0-9]?$')
                                  .hasMatch(value)) {
                                return "Enter correct age format";
                              }
                            },
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(bottom: 12.0, left: 5.0),
                            child: Text(
                              "Gender",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Color.fromARGB(255, 115, 112, 112)),
                            ),
                          ),
                          RadioListTile(
                            title: const Text("Male"),
                            value: "Male",
                            groupValue: gender,
                            onChanged: (value) {
                              setState(() {
                                gender = value!;
                              });
                            },
                          ),
                          RadioListTile(
                            title: const Text("Female"),
                            value: "Female",
                            groupValue: gender,
                            onChanged: (value) {
                              setState(() {
                                gender = value!;
                              });
                            },
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 9.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 0.0, bottom: 10.0),
                        child: GestureDetector(
                          child: MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: Container(
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(vertical: 25),
                              decoration: BoxDecoration(
                                  color: const Color(0xff1bb193),
                                  borderRadius: BorderRadius.circular(20)),
                              child: const Center(
                                child: Text(
                                  "Start",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                              ),
                            ),
                          ),
                          onTap: () {
                            var scaleName =
                                myBox.get("scaleName", defaultValue: null);
                            if (patientFormKey.currentState!.validate()) {
                              var patientName = pnameController.text;
                              var patientAge = ageController.text;
                              patientBox.put("patientName", patientName);
                              patientBox.put("patientAge", patientAge);
                              patientBox.put("patientGender", gender);
                              if (scaleName == "GERD") {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const GerdScreen()),
                                );
                              }
                              patientBox.put("patientGender", gender);
                              if (scaleName == "BMI") {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const BMIScreen()),
                                );
                              }
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
