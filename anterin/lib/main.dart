import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:anterin/routes/main_routes.dart';
// import 'package:provider/provider.dart';
// import 'package:anterin/models/UserData.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  // runApp(
  //   ChangeNotifierProvider(create: (_) => UserData(), child: const MyApp()),
  // );
  runApp(const MyApp());
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
    );
  }
}

GoRouter _initializeRoute() {
  final MainRoutes mainRoute = MainRoutes();
  GoRouter mainRouter = mainRoute.mainRouter();
  return mainRouter;
}

ThemeData _buildTheme(Brightness brightness) {
  final ThemeData baseTheme = ThemeData(brightness: brightness);

  return baseTheme.copyWith(
    colorScheme: ColorScheme.fromSeed(
      seedColor: Color.fromARGB(255, 78, 236, 54),
    ),
    textTheme: GoogleFonts.latoTextTheme(baseTheme.textTheme),
  );
}
