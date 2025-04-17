import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:github_clone/presentation/screens/splash_screen.dart';
import 'package:github_clone/themes/colors.dart';

import 'presentation/binding/initial_binding.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Poppins",
        progressIndicatorTheme: ProgressIndicatorThemeData(color: grey)
      ),
      home: const SplashScreen(),
      initialBinding: InitialBinding(),
      builder: (context, child) {
        if (child != null) {
          return SafeArea(child: child);
        }
        return SizedBox.shrink();
      },
    );
  }
}
