import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:md_calculator/main.dart';
import 'package:md_calculator/pages/doctor_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

TextEditingController employeeCodeController = TextEditingController();
TextEditingController passwordController = TextEditingController();
// bool isEmployeeLogin = false;
var employeeFormKey = GlobalKey<FormState>();

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: employeeFormKey,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 35.0, bottom: 25.0),
                    child: Align(
                      alignment: Alignment.center,
                      child: FlutterLogo(
                        size: 100,
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      "Login",
                      style: GoogleFonts.roboto(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 12.0, left: 5.0),
                    child: Text(
                      "Employee Code",
                      style: TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(255, 115, 112, 112)),
                    ),
                  ),
                  TextFormField(
                    controller: employeeCodeController,
                    keyboardType: TextInputType.name,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0))),
                        alignLabelWithHint: false,
                        prefixIcon: Icon(Icons.person),
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 25.0, vertical: 25),
                        hintText: "eg. 123456"),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter the employee code";
                      }
                      // else if (!RegExp(r'^[A-Z]{3}\d{3}$').hasMatch(value)) {
                      //   return "Enter the valid Employee Code";
                      // }
                    },
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 12.0, left: 5.0),
                    child: Text(
                      "Password",
                      style: TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(255, 115, 112, 112)),
                    ),
                  ),
                  TextFormField(
                    obscureText: true,
                    controller: passwordController,
                    keyboardType: TextInputType.name,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20.0),
                          ),
                        ),
                        prefixIcon: Icon(Icons.lock),
                        alignLabelWithHint: false,
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 25.0, vertical: 25),
                        hintText: "Enter your password"),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter the password";
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
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
                              "Login",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          ),
                        ),
                      ),
                      onTap: () {
                        if (employeeFormKey.currentState!.validate()) {
                          loginBox.put("isEmployeeLogin", true);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const DoctorScreen()),
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
