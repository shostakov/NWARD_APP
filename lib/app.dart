import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'login.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Login(),
      theme: ThemeData(
          fontFamily: GoogleFonts.poppins().fontFamily,
          primaryColor: const Color.fromARGB(255, 53, 129, 170),
          primaryColorDark: const Color.fromARGB(255, 48, 118, 156),
          primaryColorLight: const Color.fromARGB(255, 99, 169, 207),
          splashColor: const Color.fromARGB(255, 255, 156, 15),
          hintColor: const Color.fromARGB(255, 16, 37, 55),
          textTheme: Theme.of(context).textTheme.apply(
              bodyColor: const Color.fromARGB(255, 16, 37, 55),
              fontFamily: GoogleFonts.poppins().fontFamily),
          appBarTheme: AppBarTheme(
              backgroundColor: const Color.fromARGB(255, 48, 118, 156),
              foregroundColor: Colors.white,
              titleTextStyle: TextStyle(
                fontFamily: GoogleFonts.poppins().fontFamily,
                color: Colors.white,
                fontSize: 24.0,
              )),
          colorScheme: const ColorScheme(
              background: Color.fromARGB(255, 179, 179, 179),
              brightness: Brightness.dark,
              error: Colors.white,
              onBackground: Colors.black,
              onError: Colors.black,
              onPrimary: Colors.black,
              onSecondary: Colors.black,
              onSurface: Colors.black,
              primary: Color.fromARGB(255, 53, 129, 170),
              secondary: Color.fromARGB(255, 255, 156, 15),
              surface: Color.fromARGB(255, 16, 37, 55))),
    );
  }
}
