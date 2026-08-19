import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app_routes.dart';
import 'app_pages.dart';
import 'constants/colors.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      color: kBgDark,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: kPurple,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
        fontFamily: 'Roboto',
      ),
      initialRoute: AppRoutes.profile,
      getPages: AppPages.pages,
    );
  }
}
