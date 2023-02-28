import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InputParameter extends StatelessWidget {
  const InputParameter({super.key, required this.name});
  final String name;
  @override
  Widget build(BuildContext context) {
    return Container(
        // color: Colors.blue,
        child: Text(
      name,
      style: GoogleFonts.roboto(fontSize: 20.0),
    ));
  }
}
