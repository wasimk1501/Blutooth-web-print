import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:md_calculator/main.dart';
import 'package:md_calculator/pages/home_page.dart';

class DoctorScreen extends StatefulWidget {
  const DoctorScreen({super.key});

  @override
  State<DoctorScreen> createState() => _DoctorScreenState();
}

TextEditingController mobileNoController = TextEditingController();
TextEditingController specialityController = TextEditingController();
TextEditingController nameController = TextEditingController();
bool isFocused = false;

final doctorFormKey = GlobalKey<FormState>();

class _DoctorScreenState extends State<DoctorScreen> {
  @override
  Widget build(BuildContext context) {
    // var doctorName = doctorBox.get("doctorName", defaultValue: false);
    // var doctorSpeciality = doctorBox.get("doctorSpeciality");
    // var doctorMobileNo = doctorBox.get("doctorMobileNo");
    // bool isDoctorEdit = loginBox.get("isDoctorEdit");
    // if (isDoctorEdit) {
    //   nameController.text = doctorName;
    //   specialityController.text = doctorSpeciality;
    //   mobileNoController.text = doctorMobileNo;
    // }
    return Scaffold(
      body: Form(
        key: doctorFormKey,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Container(
                    width: double.infinity,
                    height: 80.0,
                    decoration: const BoxDecoration(
                        color: Color(0xff1bb193),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10.0),
                            bottomRight: Radius.circular(10.0))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 20.0),
                      child: Text(
                        "Doctor Details",
                        style: GoogleFonts.roboto(
                          fontSize: 30.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ),
                  ),
                ),
                // Container(
                //   width: 120.0,
                //   height: 120.0,
                //   decoration: BoxDecoration(
                //       color: Color(0xff1590D4),
                //       borderRadius: BorderRadius.circular(100)),
                //   child: const Icon(
                //     Icons.person_2,
                //     size: 40.0,
                //     color: Colors.white,
                //   ),
                // ),
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
                              "Doctor name",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Color.fromARGB(255, 115, 112, 112)),
                            ),
                          ),
                          TextFormField(
                            // onChanged: (value) {
                            //   if (RegExp(
                            //           r'^Dr\. [A-Z][a-z]+([ ]?[A-Z]?[a-z]+)*$')
                            //       .hasMatch(value)) {
                            //     return;
                            //   }
                            // },
                            controller: nameController,
                            keyboardType: TextInputType.name,
                            textCapitalization: TextCapitalization.words,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xff1bb193),
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.0))),
                              alignLabelWithHint: false,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 25.0, vertical: 25),
                              hintText: "eg. Dr. John Doe Jr.",
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Enter the details";
                              } else if (!RegExp(
                                      r'^Dr\. [A-Z][a-z]+([ ]?[A-Z]?[a-z]+)*$')
                                  .hasMatch(value)) {
                                return "Enter correct name format";
                              }
                            },
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(bottom: 12.0, left: 5.0),
                            child: Text(
                              "Speciality",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Color.fromARGB(255, 115, 112, 112)),
                            ),
                          ),
                          TextFormField(
                            controller: specialityController,
                            keyboardType: TextInputType.name,
                            textCapitalization: TextCapitalization.words,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(20.0))),
                                alignLabelWithHint: false,
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 25.0, vertical: 25),
                                hintText: "eg. General Surgeon"),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Enter Speciality";
                              }
                              // else if (!RegExp(r'^[a-zA-Z]+$')
                              //     .hasMatch(value)) {
                              //   return "Enter in correct format";
                              // }
                            },
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(bottom: 12.0, left: 5.0),
                            child: Text(
                              "Mobile Number",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Color.fromARGB(255, 115, 112, 112)),
                            ),
                          ),
                          TextFormField(
                            // focusNode: FocusNode()
                            //   ..addListener(() {
                            //     _isFocused = !(_isFocused || _isFocused);
                            //   }),
                            controller: mobileNoController,
                            keyboardType: TextInputType.phone,
                            decoration: const InputDecoration(
                              // prefixText: "+91",
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.0))),
                              alignLabelWithHint: false,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 25.0, vertical: 25),
                              hintText: "eg. 7890000000",
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Enter mobile number";
                              } else if (!RegExp(r'^[789]\d{9}$')
                                  .hasMatch(value)) {
                                return "Enter correct mobile number";
                              }
                            },
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 9.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0, bottom: 20),
                        child: GestureDetector(
                          child: MouseRegion(
                            cursor: MaterialStateMouseCursor.clickable,
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
                            if (doctorFormKey.currentState!.validate()) {
                              var doctorName = nameController.text;
                              var doctorSpeciality = specialityController.text;
                              var doctorMobileNo = mobileNoController.text;
                              doctorBox.put("doctorName", doctorName);
                              doctorBox.put(
                                  "doctorSpeciality", doctorSpeciality);
                              doctorBox.put("doctorMobileNo", doctorMobileNo);
                              loginBox.put("isDoctorLogin", true);
                              doctorFormKey.currentState!.reset();
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const HomePage(),
                                ),
                              );
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
