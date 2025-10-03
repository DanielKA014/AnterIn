import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:anterin/routes/main_router.dart';
import 'package:provider/provider.dart';
import 'package:anterin/models/UserData.dart';
import 'package:anterin/screens/activity_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create: (_) => UserData(), child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static final String title = 'User Profile';

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: _buildTheme(Brightness.light),
      routerConfig: _initializeRoute(),
      title: title,
    );
  }

  // Inisialisasi router menggunakan GoRouter
  GoRouter _initializeRoute() {
    final MainRouter mainRoute = MainRouter();
    GoRouter mainRouter = mainRoute.mainRouter();

    return mainRouter;
  }

  // Tema aplikasi yang menggunakan Google Fonts
  ThemeData _buildTheme(Brightness brightness) {
    final ThemeData baseTheme = ThemeData(brightness: brightness);

    return baseTheme.copyWith(
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color.fromARGB(
          255,
          78,
          236,
          54,
        ), // Gunakan warna primer
      ),
      textTheme: GoogleFonts.latoTextTheme(
        baseTheme.textTheme,
      ), // Menggunakan Lato font
    );
  }
}
