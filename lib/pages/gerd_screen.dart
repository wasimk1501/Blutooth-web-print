import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:md_calculator/main.dart';
import 'package:md_calculator/pages/gerd_result.dart';
import 'package:md_calculator/pages/get_result.dart';
import 'package:md_calculator/pages/model/gerd_question_model.dart';
import 'package:md_calculator/utils/input_parameter.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class GerdScreen extends StatefulWidget {
  const GerdScreen({super.key});

  @override
  State<GerdScreen> createState() => _GerdScreenState();
}

PageController _pageController = PageController();
final questions = [
  Question(
      text: "1. Do you get heartburn?",
      selectedValue: 0,
      type: "Acid Reflux Related Symptom",
      options: [
        const Option(text: "Never", isSelectedValue: 0),
        const Option(text: "Occationally", isSelectedValue: 1),
        const Option(text: "Sometimes", isSelectedValue: 2),
        const Option(text: "Often", isSelectedValue: 3),
        const Option(text: "Always", isSelectedValue: 4),
      ]),
  Question(
      text: "2. Does your stomach get bloated?",
      selectedValue: 0,
      type: "Dyspeptic (Dysmotility) Symptom",
      options: [
        const Option(text: "Never", isSelectedValue: 0),
        const Option(text: "Occationally", isSelectedValue: 1),
        const Option(text: "Sometimes", isSelectedValue: 2),
        const Option(text: "Often", isSelectedValue: 3),
        const Option(text: "Always", isSelectedValue: 4),
      ]),
  Question(
      text: "3. Does your stomach ever feel heavy after meals?",
      selectedValue: 0,
      type: "Dyspeptic (Dysmotility) Symptom",
      options: [
        const Option(text: "Never", isSelectedValue: 0),
        const Option(text: "Occationally", isSelectedValue: 1),
        const Option(text: "Sometimes", isSelectedValue: 2),
        const Option(text: "Often", isSelectedValue: 3),
        const Option(text: "Always", isSelectedValue: 4),
      ]),
  Question(
      text: "4. Do you sometimes subconsciously rub your chest with your hand?",
      selectedValue: 0,
      type: "Acid Reflux Related Symptom",
      options: [
        const Option(text: "Never", isSelectedValue: 0),
        const Option(text: "Occationally", isSelectedValue: 1),
        const Option(text: "Sometimes", isSelectedValue: 2),
        const Option(text: "Often", isSelectedValue: 3),
        const Option(text: "Always", isSelectedValue: 4),
      ]),
  Question(
      text: "5. Do you ever feel sick after meals?",
      selectedValue: 0,
      type: "Dyspeptic (Dysmotility) Symptom",
      options: [
        const Option(text: "Never", isSelectedValue: 0),
        const Option(text: "Occationally", isSelectedValue: 1),
        const Option(text: "Sometimes", isSelectedValue: 2),
        const Option(text: "Often", isSelectedValue: 3),
        const Option(text: "Always", isSelectedValue: 4),
      ]),
  Question(
      text: "6. Do you get heartburn after meals?",
      selectedValue: 0,
      type: "Acid Reflux Related Symptom",
      options: [
        const Option(text: "Never", isSelectedValue: 0),
        const Option(text: "Occationally", isSelectedValue: 1),
        const Option(text: "Sometimes", isSelectedValue: 2),
        const Option(text: "Often", isSelectedValue: 3),
        const Option(text: "Always", isSelectedValue: 4),
      ]),
  Question(
      text: "7. Do you have an unusual (e.g. burning)sensation in your throat?",
      selectedValue: 0,
      type: "Acid Reflux Related Symptom",
      options: [
        const Option(text: "Never", isSelectedValue: 0),
        const Option(text: "Occationally", isSelectedValue: 1),
        const Option(text: "Sometimes", isSelectedValue: 2),
        const Option(text: "Often", isSelectedValue: 3),
        const Option(text: "Always", isSelectedValue: 4),
      ]),
  Question(
      text: "8. Do you feel full while eating meals?",
      selectedValue: 0,
      type: "Dyspeptic (Dysmotility) Symptom",
      options: [
        const Option(text: "Never", isSelectedValue: 0),
        const Option(text: "Occationally", isSelectedValue: 1),
        const Option(text: "Sometimes", isSelectedValue: 2),
        const Option(text: "Often", isSelectedValue: 3),
        const Option(text: "Always", isSelectedValue: 4),
      ]),
  Question(
      text: "9. Do some things get stuck when you swallow?",
      selectedValue: 0,
      type: "Acid Reflux Related Symptom",
      options: [
        const Option(text: "Never", isSelectedValue: 0),
        const Option(text: "Occationally", isSelectedValue: 1),
        const Option(text: "Sometimes", isSelectedValue: 2),
        const Option(text: "Often", isSelectedValue: 3),
        const Option(text: "Always", isSelectedValue: 4),
      ]),
  Question(
      text: "10. Do you get bitter liquid (acid) coming up into your throat?",
      selectedValue: 0,
      type: "Acid Reflux Related Symptom",
      options: [
        const Option(text: "Never", isSelectedValue: 0),
        const Option(text: "Occationally", isSelectedValue: 1),
        const Option(text: "Sometimes", isSelectedValue: 2),
        const Option(text: "Often", isSelectedValue: 3),
        const Option(text: "Always", isSelectedValue: 4),
      ]),
  Question(
      text: "11. Do you burp a lot?",
      selectedValue: 0,
      type: "Dyspeptic (Dysmotility) Symptom",
      options: [
        const Option(text: "Never", isSelectedValue: 0),
        const Option(text: "Occationally", isSelectedValue: 1),
        const Option(text: "Sometimes", isSelectedValue: 2),
        const Option(text: "Often", isSelectedValue: 3),
        const Option(text: "Always", isSelectedValue: 4),
      ]),
  Question(
      text: "12. Do you get heartburn if you bend over?",
      selectedValue: 0,
      type: "Acid Reflux Related Symptom",
      options: [
        const Option(text: "Never", isSelectedValue: 0),
        const Option(text: "Occationally", isSelectedValue: 1),
        const Option(text: "Sometimes", isSelectedValue: 2),
        const Option(text: "Often", isSelectedValue: 3),
        const Option(text: "Always", isSelectedValue: 4),
      ]),
];

class _GerdScreenState extends State<GerdScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                    Hero(
                      tag: "IconTag",
                      transitionOnUserGestures: false,
                      child: Image.asset(
                        "assets/bmiIcon.png",
                        width: 40.0,
                      ),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.only(left: 10, top: 10),
                      child: Text("GERD Calculator",
                          style: GoogleFonts.roboto(
                              fontSize: 30, fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
                SizedBox(
                  height: 550,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: PageView.builder(
                          controller: _pageController,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: questions.length,
                          itemBuilder: (context, index) {
                            final _question = questions[index];
                            log(_question.text);
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 20,
                                ),
                                // Align(
                                //     alignment: Alignment.topRight,
                                //     child: Text(
                                //         "Question ${index + 1}/${questions.length}")),
                                // const Divider(
                                //   thickness: 1,
                                //   color: Colors.grey,
                                // ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                Text(
                                  questions[index].text,
                                  style: const TextStyle(
                                      fontSize: 25.0,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400),
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                Expanded(
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        RadioListTile(
                                          title: Text(
                                            questions[index].options[0].text,
                                          ),
                                          value: questions[index]
                                              .options[0]
                                              .isSelectedValue,
                                          groupValue: _question.text,
                                          onChanged: (value) {
                                            questions[index].selectedValue =
                                                int.parse(value.toString());

                                            log(questions[index]
                                                .selectedValue
                                                .toString());
                                          },
                                        ),
                                        RadioListTile(
                                          title: Text(
                                            questions[index].options[1].text,
                                            overflow: TextOverflow.clip,
                                          ),
                                          value: questions[index]
                                              .options[1]
                                              .isSelectedValue,
                                          groupValue: _question.text,
                                          onChanged: (value) {
                                            questions[index].selectedValue =
                                                int.parse(value.toString());
                                            log(questions[index]
                                                .selectedValue
                                                .toString());
                                          },
                                        ),
                                        RadioListTile(
                                          title: Text(
                                            questions[index].options[2].text,
                                            overflow: TextOverflow.clip,
                                          ),
                                          value: questions[index]
                                              .options[2]
                                              .isSelectedValue,
                                          groupValue: _question.text,
                                          onChanged: (value) {
                                            questions[index].selectedValue =
                                                int.parse(value.toString());

                                            log(questions[index]
                                                .selectedValue
                                                .toString());
                                          },
                                        ),
                                        RadioListTile(
                                          title: Text(
                                            questions[index].options[3].text,
                                            overflow: TextOverflow.clip,
                                          ),
                                          value: questions[index]
                                              .options[3]
                                              .isSelectedValue,
                                          groupValue: _question.text,
                                          onChanged: (value) {
                                            questions[index].selectedValue =
                                                int.parse(value.toString());

                                            log(questions[index]
                                                .selectedValue
                                                .toString());
                                          },
                                        ),
                                        RadioListTile(
                                          title: Text(
                                            questions[index].options[4].text,
                                            overflow: TextOverflow.clip,
                                          ),
                                          value: questions[index]
                                              .options[4]
                                              .isSelectedValue,
                                          groupValue: _question.text,
                                          onChanged: (value) {
                                            questions[index].selectedValue =
                                                int.parse(value.toString());

                                            log(questions[index]
                                                .selectedValue
                                                .toString());
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Center(
                                  child: SmoothPageIndicator(
                                    controller: _pageController,
                                    count: 12,
                                    effect: ExpandingDotsEffect(
                                      // scale: 1.8,
                                      activeDotColor: appColor,
                                      spacing: 10,
                                      paintStyle: PaintingStyle.fill,
                                      strokeWidth: 1,
                                      dotColor: appColor.withOpacity(0.6),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
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
                                          borderRadius:
                                              BorderRadius.circular(10),
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              index + 1 < questions.length
                                                  ? "Next Question"
                                                  : "Show Result",
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
                                      if (index + 1 < questions.length) {
                                        _pageController.nextPage(
                                            duration: const Duration(
                                                microseconds: 250),
                                            curve: Curves.easeInExpo);
                                      } else {
                                        int acidRefluxTotal = questions
                                            .where((element) =>
                                                element.type ==
                                                "Acid Reflux Related Symptom")
                                            .map<int>((element) =>
                                                element.selectedValue)
                                            .fold<int>(
                                                0,
                                                (previousValue, element) =>
                                                    previousValue + element);
                                        int dyspepticTotal = questions
                                            .where((element) =>
                                                element.type ==
                                                "Dyspeptic (Dysmotility) Symptom")
                                            .map<int>((element) =>
                                                element.selectedValue)
                                            .fold<int>(
                                                0,
                                                (previousValue, element) =>
                                                    previousValue + element);

                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => GetResult(
                                                      value1: acidRefluxTotal,
                                                      value2: dyspepticTotal,
                                                      scaleName: "GERD",
                                                    )));

                                        log(acidRefluxTotal.toString());
                                        log(dyspepticTotal.toString());
                                      }
                                    },
                                  ),
                                ),
                              ],
                            );
                            // return buildQuestion(_question);
                          },
                        ),
                      ), // PageView.builder(itemBuilder: itemBuilder)
                    ],
                  ),
                ),
                createrDetail(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget createrDetail() {
    return Column(
      children: [
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
                  padding: const EdgeInsets.only(left: 15, top: 20, bottom: 15),
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15.0),
                child: RichText(
                  text: TextSpan(
                      text: "The equation was originally created by ",
                      style: GoogleFonts.actor(
                          fontSize: 16,
                          letterSpacing: 1.5,
                          color: Colors.black),
                      children: const <TextSpan>[
                        TextSpan(
                          text: "Adolphe Quetelet, a Belgian, in 1832",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                            text:
                                " as a method to define the standard proportions of the human build. Only in the last half century has the BMI been used as a means to determine body-fat percentage. Ancel Keys, a physiology professor, used Quetelet's equation as part of a 1972 published report on obesity and created the name body mass index or BMI. While widely used in population health studies, the BMI equation has been critiqued for its use in individual diagnoses for determining whether someone is overweight or obese.")
                      ]),
                ),
                // Text(
                //   "The equation was originally created by Adolphe Quetelet, a Belgian, in 1832 as a method to define the standard proportions of the human build. Only in the last half century has the BMI been used as a means to determine body-fat percentage. Ancel Keys, a physiology professor, used Quetelet's equation as part of a 1972 published report on obesity and created the name body mass index or BMI. While widely used in population health studies, the BMI equation has been critiqued for its use in individual diagnoses for determining whether someone is overweight or obese.",
                //   style: GoogleFonts.actor(
                //       fontSize: 16, letterSpacing: 1.5),
                // ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Column GerdQuestions(
      String questionTitle, String groupValue, int questionPoints) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 5.0, left: 5.0),
          child: Text(
            questionTitle,
            style: const TextStyle(
                fontSize: 18, color: Color.fromARGB(255, 115, 112, 112)),
          ),
        ),
        RadioListTile(
          title: const Text(
            "Never",
            overflow: TextOverflow.clip,
          ),
          value: 0,
          groupValue: questionPoints,
          onChanged: (value) {
            setState(() {
              questionPoints = value!;
            });
          },
        ),
        RadioListTile(
          title: const Text("Occationally"),
          value: 1,
          groupValue: questionPoints,
          onChanged: (value) {
            setState(() {
              questionPoints = value!;
            });
          },
        ),
        RadioListTile(
          title: const Text("Sometimes"),
          value: 2,
          groupValue: questionPoints,
          onChanged: (value) {
            setState(() {
              questionPoints = value!;
            });
          },
        ),
        RadioListTile(
          title: const Text("Often"),
          value: 3,
          groupValue: questionPoints,
          onChanged: (value) {
            setState(() {
              questionPoints = value!;
            });
          },
        ),
        RadioListTile(
          title: const Text("Always"),
          value: 4,
          groupValue: questionPoints,
          onChanged: (value) {
            setState(() {
              // a1 = questionPoints = value!;
              print(questionPoints);
            });
          },
        ),
      ],
    );
  }

  Widget buildQuestion(Question question) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 20.0,
        ),
        Text(
          question.text,
          style: const TextStyle(
              fontSize: 25.0, color: Colors.black, fontWeight: FontWeight.w400),
        ),
        const SizedBox(
          height: 20.0,
        ),
        Expanded(
          child: OptionsWidget(
            question: question,
            onClickedOption: (option) {
              if (question.isLocked) {
                return;
              } else {
                question.isLocked = true;
                question.selectedOption = option;
              }
            },
          ),
        ),
      ],
    );
  }
}

class OptionsWidget extends StatelessWidget {
  final ValueChanged<Option> onClickedOption;
  final Question question;
  const OptionsWidget(
      {super.key, required this.question, required this.onClickedOption});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: question.options
            .map((option) => buildOption(context, option))
            .toList(),
      ),
    );
  }

  Widget buildOption(BuildContext context, Option option) {
    // bool selectedColor = false;
    return GestureDetector(
      onTap: () {
        var a = option.isSelectedValue;
      },
      child: Container(
        padding: const EdgeInsets.only(left: 20.0),
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        // alignment: Alignment.center,
        height: 50.0,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(color: Colors.grey),
        ),
        child: Row(
          children: [
            Text(
              option.text,
              style: const TextStyle(
                fontSize: 15.0,
                fontFamily: "Monospace",
              ),
            ),
          ],
        ),
      ),
    );
  }

  // getColorForOption(Option option, Question question) {
  //   final isSelected = question.selectedOption;
  //   if (question.isLocked) {
  //     if (isSelected!= null) {
  //       option.
  //     }
  //   }
  // }
}
