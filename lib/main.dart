import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'resources/constants/chi_styles.dart';
import 'resources/constants/routes.dart';
import 'resources/themes/app_theme/chi_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      builder: (_, __) => Consumer(
        builder: (context, ThemeProvider provider, child) => GetMaterialApp(
          title: 'Attendance Manager',
          theme: CHIStyles.lightThemeData(),
          darkTheme: CHIStyles.darkThemeData(),
          themeMode: provider.themeMode,
          debugShowCheckedModeBanner: false,
          initialRoute: '/main-screen',
          getPages: appRoutes(),
        ),
      ),
    );
  }
}
