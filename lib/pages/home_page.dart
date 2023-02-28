// import 'dart:io' if (dart.library.io) 'dart:ffi';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:md_calculator/main.dart';
import 'package:md_calculator/pages/bmi_screen.dart';
import 'package:md_calculator/pages/doctor_screen.dart';
import 'package:md_calculator/pages/login_screen.dart';
import 'package:md_calculator/pages/patient_screen.dart';
import 'package:md_calculator/utils/text_detail.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // static final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  // Map<String, dynamic> _deviceData = <String, dynamic>{};
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   initPlatformState();
  // }

  // Future<void> initPlatformState() async {
  //   var deviceData = <String, dynamic>{};
  //   if (Platform.isAndroid) {
  //     var deviceData =
  //         _readAndroidBuildData(await deviceInfoPlugin.androidInfo);
  //     print(deviceData);
  //   }
  // }

  // String _readAndroidBuildData(AndroidDeviceInfo build) {
  //   return build.serialNumber;
  // }
  var testName;

  @override
  Widget build(BuildContext context) {
    var doctorName = doctorBox.get("doctorName");
    var doctorSpeciality = doctorBox.get("doctorSpeciality");
    var doctorMobileNo = doctorBox.get("doctorMobileNo");

    return Scaffold(
      // backgroundColor: Colors.white,

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 40.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child: Image.asset(
                                      "assets/default_profile.jpg",
                                      fit: BoxFit.contain,
                                      width: 40.0,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                Text(
                                  "Hello Employee",
                                  style: GoogleFonts.roboto(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black),
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                doctorBox.clear();
                                loginBox.clear();
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const LoginScreen()));
                              },
                              child: MouseRegion(
                                cursor: SystemMouseCursors.click,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 10.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: Colors.white,
                                    boxShadow: const [
                                      // BoxShadow(
                                      //   color: Color.fromARGB(255, 231, 225, 225),
                                      //   offset: Offset(3.0, 5.0),
                                      //   blurRadius: 9,
                                      // ),
                                    ],
                                  ),
                                  child: const Center(
                                    child: Text(
                                      "Logout",
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.0),
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromARGB(255, 231, 225, 225),
                              offset: Offset(3.0, 5.0),
                              blurRadius: 9,
                            ),
                          ],
                        ),
                        // padding: const EdgeInsets.symmetric(
                        //     vertical: 20.0, horizontal: 20.0),
                        child: Stack(
                          // alignment: Alignment.topCenter,
                          children: [
                            Align(
                              alignment: Alignment.topCenter,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 20.0, horizontal: 20.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "$doctorName",
                                      style: GoogleFonts.roboto(
                                          fontSize: 24.0,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black),
                                    ),
                                    Text(
                                      "$doctorSpeciality",
                                      style: GoogleFonts.roboto(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.w500,
                                          color:
                                              Color.fromARGB(255, 78, 76, 76)),
                                    ),
                                    Text(
                                      "+91 $doctorMobileNo",
                                      style: GoogleFonts.roboto(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.w400,
                                          color:
                                              Color.fromARGB(255, 17, 17, 17)),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                // loginBox.put("isDoctorEdit", true);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const DoctorScreen()));
                              },
                              child: Align(
                                alignment: Alignment.topRight,
                                child: MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10.0, horizontal: 10.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      color: Colors.white,
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Color.fromARGB(
                                              255, 255, 255, 255),
                                          offset: Offset(1.0, 5.0),
                                          blurRadius: 4,
                                        ),
                                      ],
                                    ),
                                    child: const Icon(
                                      Icons.edit,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      GestureDetector(
                        onTap: () {
                          // doctorBox.clear();
                          // // loginBox.put("isDoctorLogin", false);
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const DoctorScreen()));
                        },
                        child: MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: appColor,
                              boxShadow: const [
                                BoxShadow(
                                  color: Color.fromARGB(255, 231, 225, 225),
                                  offset: Offset(3.0, 5.0),
                                  blurRadius: 9,
                                ),
                              ],
                            ),
                            child: const Center(
                              child: Text(
                                "Change Doctor",
                                style: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Select scale to proceed",
                    style: GoogleFonts.jacquesFrancois(
                        fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                GestureDetector(
                  child: ScaleType("Body Mass Index"),
                  onTap: () {
                    myBox.put("scaleName", "BMI");
                    // initPlatformState();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PatientScreen()));
                  },
                ),
                GestureDetector(
                  child: ScaleType("GERD Calculator"),
                  onTap: () {
                    myBox.put("scaleName", "GERD");
                    // initPlatformState();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PatientScreen()));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  MouseRegion ScaleType(String title) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 10.0,
                offset: Offset(2.0, 5.0),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/bmiIcon.png",
                width: 50,
              ),
              const SizedBox(
                width: 20,
              ),
              Text(
                title,
                style: GoogleFonts.jacquesFrancois(
                    fontSize: 25, fontWeight: FontWeight.w500),
              )
            ],
          ),
        ),
      ),
    );
  }
}
