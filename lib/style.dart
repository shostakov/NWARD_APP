import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

String? fontNameDefault = GoogleFonts.poppins().fontFamily;

TextStyle appBarTextStyle = TextStyle(
    fontFamily: fontNameDefault,
    fontWeight: FontWeight.w300,
    fontSize: 24.0,
    color: Colors.white);

TextStyle headerTextStyle = TextStyle(
  fontFamily: fontNameDefault,
  fontWeight: FontWeight.w300,
  fontSize: 24.0,
  color: const Color.fromARGB(255, 16, 37, 55),
);

TextStyle bodyTextStyle = TextStyle(
  fontFamily: fontNameDefault,
  fontWeight: FontWeight.w300,
  fontSize: 16.0,
  color: const Color.fromARGB(255, 16, 37, 55),
);

TextStyle otherMonthTextStyle = TextStyle(
  fontFamily: fontNameDefault,
  fontWeight: FontWeight.w100,
  fontSize: 16.0,
  color: const Color.fromARGB(100, 16, 37, 55),
);

TextStyle apptTextStyle = TextStyle(
  fontFamily: fontNameDefault,
  fontWeight: FontWeight.w300,
  fontSize: 16.0,
  color: Colors.white,
);
