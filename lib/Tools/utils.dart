import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle textStyle(double size, [Color? color, FontWeight? fw]){
  return GoogleFonts.montserrat(
    fontSize: size,
    color: color,
    fontWeight: fw
  );
}

Color tuscanyColor(){
  return Color(0xe9cda2ab);
}

Color honeyYellow(){
  return Color(0xedf6ae2d);
}

Color orchidCrayola(){
  return Color(0x9af896d8);
}


List timesOptions= [
  "300",
  "600",
  "900",
  "1200",
  "1500",
  "1800",
  "2100",
  "2400"
];

List numberSessions = [
  "1",
  "2",
  "3",
  "4",
  "5",
  "6",
  "7",
  "8",
  "9",
  "10"
];