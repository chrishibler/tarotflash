import 'package:flutter/material.dart';
import 'package:tarotflash/pages/card_page.dart';
import 'package:tarotflash/ui/dark_cat_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tarot Flash',
      themeMode: ThemeMode.dark,
      theme: DarkCatTheme.darkData,
      home: const CardPage(),
    );
  }
}
