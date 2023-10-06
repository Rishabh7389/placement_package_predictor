import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:placement_package_predictor/prediction.dart';
import 'package:placement_package_predictor/result.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: GoogleFonts.lato().fontFamily,
      ),
      initialRoute: "/prediction",
      routes: {
        "/prediction": (context) => PredictionPage(),
        "/result": (context) => ResultPage()
      },
    );
  }
}
