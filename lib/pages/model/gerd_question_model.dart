class Question {
  final String text;
  final List<Option> options;
  bool isLocked;
  Option? selectedOption;
  final String type;
  int selectedValue;

  Question({
    required this.text,
    required this.options,
    required this.type,
    required this.selectedValue,
    this.isLocked = false,
    this.selectedOption,
  });
}

class Option {
  final String text;
  final int isSelectedValue;
  const Option({required this.text, required this.isSelectedValue});
}
