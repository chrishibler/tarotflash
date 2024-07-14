import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DarkCatTheme {
  static final baseTheme = ThemeData(brightness: Brightness.dark);
  static const Color rosewater = Color(0xFFF5E0DC);
  static const Color flamingo = Color(0xFFF2CDCD);
  static const Color pink = Color(0xFFF5C2E7);
  static const Color mauve = Color(0xFFCBA6F7);
  static const Color red = Color(0xFFF38BA8);
  static const Color maroon = Color(0xFFEBA0AC);
  static const Color peach = Color(0xFFFAB387);
  static const Color yellow = Color(0xFFF9E2AF);
  static const Color green = Color(0xFFA6E3A1);
  static const Color teal = Color(0xFF94E2D5);
  static const Color sky = Color(0xFF89DCEB);
  static const Color sapphire = Color(0xFF74C7EC);
  static const Color blue = Color(0xFF89B4FA);
  static const Color lavender = Color(0xFFB4BEFE);
  static const Color text = Color(0xFFD9E0EE);
  static const Color subtext1 = Color(0xFFC3BAC6);
  static const Color subtext0 = Color(0xFF988BA2);
  static const Color overlay2 = Color(0xFF6E6C7E);
  static const Color overlay1 = Color(0xFF575268);
  static const Color overlay0 = Color(0xFF6E6C7E);
  static const Color surface2 = Color(0xFF6E6C7E);
  static const Color surface1 = Color(0xFF575268);
  static const Color surface0 = Color(0xFF302D41);
  static const Color base = Color(0xFF1E1E2E);
  static const Color mantle = Color(0xFF181825);
  static const Color crust = Color(0xFF11111B);

  static const TextStyle heading = TextStyle(
    color: text,
    fontSize: 36,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle body = TextStyle(
    color: subtext1,
    fontSize: 24,
  );

  static final ThemeData darkData = ThemeData(
    //colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    brightness: Brightness.dark,
    useMaterial3: true,
    scaffoldBackgroundColor: DarkCatTheme.base,
    textTheme: GoogleFonts.tekoTextTheme(DarkCatTheme.baseTheme.textTheme),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: DarkCatTheme.base,
      elevation: 0,
      selectedIconTheme: IconThemeData(color: DarkCatTheme.red),
      unselectedIconTheme: IconThemeData(color: DarkCatTheme.red),
    ),
    iconTheme: const IconThemeData(color: DarkCatTheme.red),
  );
}
