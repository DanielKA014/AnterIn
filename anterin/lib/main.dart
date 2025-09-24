// import 'package:anterin/widgets/anterin_tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:anterin/routers/main_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: _buildTheme(Brightness.light),
      routerConfig: mainRouter(),
    );
  }
}

ThemeData _buildTheme(Brightness brightness) {
  final ThemeData baseTheme = ThemeData(brightness: brightness);

  return baseTheme.copyWith(
    colorScheme: ColorScheme.fromSeed(seedColor: Color(0x00008b4e)),
    textTheme: GoogleFonts.latoTextTheme(baseTheme.textTheme),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color.fromARGB(255, 130, 255, 161),
      foregroundColor: Colors.white,
    ),
  );
}
