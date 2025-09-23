import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'home_screen.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const appName = 'Custom Themes';

    return MaterialApp(
      title: appName,
      theme: _buildTheme(Brightness.light),
      home: const HomeScreen(title: appName),
    );
  }
}

ThemeData _buildTheme(Brightness brightness) {
  final ThemeData baseTheme = ThemeData(brightness: brightness);

  return baseTheme.copyWith(
    colorScheme: ColorScheme.fromSeed(seedColor: Color(0x00078a53)),
    // primaryColor: Color(0x00078a53),
    textTheme: GoogleFonts.latoTextTheme(baseTheme.textTheme),
    // appBarTheme: AppBarTheme(
    //   systemOverlayStyle: SystemUiOverlayStyle(
    //     statusBarIconBrightness: Brightness.dark,
    //   ),
    // ),
  );
}
