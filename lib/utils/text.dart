import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class modifiedText extends StatelessWidget {
  const modifiedText(
      {Key? key, this.text = '', this.color = Colors.white, this.size = 0})
      : super(key: key);
  final String text;
  final Color color;
  final double size;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.breeSerif(
        color: color,
        fontSize: size,
      ),
    );
  }
}
