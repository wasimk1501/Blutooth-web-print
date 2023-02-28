import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:md_calculator/main.dart';
import 'package:md_calculator/pages/get_result.dart';
import 'package:md_calculator/utils/input_field.dart';
import 'package:md_calculator/utils/input_parameter.dart';

class BMIScreen extends StatefulWidget {
  const BMIScreen({super.key});

  @override
  State<BMIScreen> createState() => _BMIScreenState();
}

TextEditingController weightController = TextEditingController();
TextEditingController heightController = TextEditingController();
TextEditingController targetBMIController = TextEditingController();

final formKey = GlobalKey<FormState>();

class _BMIScreenState extends State<BMIScreen> {
  String scaleName = myBox.get("scaleName");
  @override
  Widget build(BuildContext context) {
    final isKeyboard = MediaQuery.of(context).viewInsets.bottom != 0;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Form(
        key: formKey,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 15, top: 16.0, right: 15.0, bottom: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.arrow_back_rounded,
                            color: Colors.black,
                            size: 28.0,
                          )),
                      Image.asset(
                        "assets/bmiIcon.png",
                        width: 50,
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        padding: const EdgeInsets.only(left: 10, top: 10),
                        child: Text(
                          "BMI Calculator",
                          style: GoogleFonts.roboto(
                              fontSize: 30, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const InputParameter(
                        name: "Weight",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: TextFormField(
                          // onSaved: (value) => weight = int.parse(value!),
                          controller: weightController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Norm: 1 - 150 kg",
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter the weight";
                            }
                            if (!RegExp(r'[0-9]+').hasMatch(value)) {
                              return "Enter a number";
                            }
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const InputParameter(
                        name: "Height",
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: TextFormField(
                          // onSaved: (value) => height = int.parse(value!),
                          controller: heightController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Norm: 152 - 213 cm",
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter the height";
                            }
                            if (!RegExp(r'[0-9]+').hasMatch(value)) {
                              return "Enter a number";
                            }
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const InputParameter(
                        name: "Target BMI",
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: TextFormField(
                          // onSaved: (value) => targetBMI = int.parse(value!),
                          controller: targetBMIController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Norm: 20 -25 ",
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter the Target BMI";
                            }
                            if (!RegExp(r'[0-9]+').hasMatch(value)) {
                              return "Enter a number";
                            }
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: GestureDetector(
                          child: MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 20.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: const Color(0xff1bb193),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.grey,
                                    offset: Offset(3.0, 4.0),
                                    blurRadius: 10,
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Get Result",
                                    style: GoogleFonts.abhayaLibre(
                                        fontSize: 25.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const Icon(
                                    Icons.arrow_forward,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          onTap: () {
                            if (formKey.currentState!.validate()) {
                              var weight =
                                  int.parse(weightController.text.trim());
                              var height =
                                  int.parse(heightController.text.trim());
                              var targetBMI = targetBMIController.text.trim();
                              print(weight * 100 * 100 / (height * height));
                              var bmiresult =
                                  weight * 100 * 100 / (height * height);

                              var bsaresult = sqrt(height * weight / 3600);

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => GetResult(
                                    value1: bmiresult,
                                    value2: bsaresult,
                                    scaleName: scaleName,
                                  ),
                                ),
                              );
                              formKey.currentState!.reset();
                            }
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 15.0),
                        child: Center(
                            child: Text(
                          "Reference",
                          style: TextStyle(fontSize: 20.0),
                        )),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.grey,
                              offset: Offset(3.0, 4.0),
                              blurRadius: 10,
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                color: Color(0xff1bb193),
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(20),
                                  topLeft: Radius.circular(20),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 15, top: 20, bottom: 15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      "Adolphe Quetelet",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: 1.1,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "Creator",
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: 1.12,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 15.0),
                              child: RichText(
                                text: TextSpan(
                                    text:
                                        "The equation was originally created by ",
                                    style: GoogleFonts.actor(
                                        fontSize: 16,
                                        letterSpacing: 1.5,
                                        color: Colors.black),
                                    children: const <TextSpan>[
                                      TextSpan(
                                        text:
                                            "Adolphe Quetelet, a Belgian, in 1832",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      TextSpan(
                                          text:
                                              " as a method to define the standard proportions of the human build. Only in the last half century has the BMI been used as a means to determine body-fat percentage. Ancel Keys, a physiology professor, used Quetelet's equation as part of a 1972 published report on obesity and created the name body mass index or BMI. While widely used in population health studies, the BMI equation has been critiqued for its use in individual diagnoses for determining whether someone is overweight or obese.")
                                    ]),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
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
