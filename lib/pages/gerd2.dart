import 'package:flutter/material.dart';

class GerdS extends StatefulWidget {
  const GerdS({super.key});

  @override
  State<GerdS> createState() => _GerdSState();
}

class _GerdSState extends State<GerdS> {
  final List<Map<String, dynamic>> _questions = [
    {
      'question': 'Do you get heartburn?',
      'options': ['NEVER', 'OCCASIONALLY', 'SOMETIMES', 'OFTEN', 'ALWAYS'],
      'group_value': 'Acid reflux related symptom',
    },
    {
      'question': 'Does your stomach get bloated?',
      'options': ['NEVER', 'OCCASIONALLY', 'SOMETIMES', 'OFTEN', 'ALWAYS'],
      'group_value': 'Dyspeptic (Dysmotility) symptom',
    },
    // add more questions here
  ];
  int totalValue = 0;
  bool submitEnabled = false;
  void checkSubmitEnabled() {
    setState(() {
      submitEnabled = radioAnswers.contains(0) ? false : true;
    });
  }

  List<int> radioAnswers = [0, 0];
  int getRadioValue(val) {
    if (val == 1) {
      return 1;
    } else if (val == 2) {
      return 2;
    } else if (val == 3) {
      return 3;
    } else if (val == 4) {
      return 4;
    }
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: _questions.length,
        itemBuilder: (context, index) {
          return Expanded(
            child: Column(
              children: [
                Text(_questions[index]['question']),
                RadioListTile(
                  title: const Text(
                    "Never",
                    overflow: TextOverflow.clip,
                  ),
                  value: 0,
                  groupValue: _questions[index]['group_value'],
                  onChanged: (value) {
                    setState(() {
                      radioAnswers[index] = getRadioValue(value);
                      checkSubmitEnabled();
                    });
                  },
                ),
                RadioListTile(
                  title: const Text("Occationally"),
                  value: 1,
                  groupValue: _questions[index]['group_value'],
                  onChanged: (value) {
                    setState(() {
                      radioAnswers[index] = getRadioValue(value);
                      checkSubmitEnabled();
                    });
                  },
                ),
                RadioListTile(
                  title: const Text("Sometimes"),
                  value: 2,
                  groupValue: _questions[index]['group_value'],
                  onChanged: (value) {
                    setState(() {
                      radioAnswers[index] = getRadioValue(value);
                      checkSubmitEnabled();
                    });
                  },
                ),
                RadioListTile(
                  title: const Text("Often"),
                  value: 3,
                  groupValue: _questions[index]['group_value'],
                  onChanged: (value) {
                    setState(() {
                      radioAnswers[index] = getRadioValue(value);
                      checkSubmitEnabled();
                    });
                  },
                ),
                RadioListTile(
                  title: const Text("Always"),
                  value: 4,
                  groupValue: _questions[index]['group_value'],
                  onChanged: (value) {
                    setState(() {
                      radioAnswers[index] = getRadioValue(value);
                      checkSubmitEnabled();
                    });
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
