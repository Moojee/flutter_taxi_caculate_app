import 'package:flutter/material.dart';
import 'package:flutter_taxi_calculate_app/views/taxi_home_ui.dart';
import 'package:google_fonts/google_fonts.dart';

void main (){
  runApp(FlutterTaxiCalculateApp());
}

class FlutterTaxiCalculateApp extends StatefulWidget {
  const FlutterTaxiCalculateApp({super.key});

  @override
  State<FlutterTaxiCalculateApp> createState() => _FlutterTaxiCalculateAppState();
}

class _FlutterTaxiCalculateAppState extends State<FlutterTaxiCalculateApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TaxiHomeUI(),
      theme: ThemeData(
        textTheme: GoogleFonts.kanitTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
    );
  }
}