import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextDetail extends StatelessWidget {
  const TextDetail({super.key, required this.calcName, required this.icon});
  final String calcName;
  final Widget icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
              color: Colors.grey, blurRadius: 10.0, offset: Offset(2.0, 3.0))
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
          const SizedBox(
            width: 20,
          ),
          Text(
            calcName,
            style: GoogleFonts.jacquesFrancois(
                fontSize: 40, fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}
