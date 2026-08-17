import 'package:flutter/material.dart';
import 'constants/colors.dart';
import 'pages/home_page.dart';
import 'pages/task_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo Training',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: kPurple,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
        fontFamily: 'Roboto',
      ),
      initialRoute: '/profile',
      routes: {
        '/profile': (context) => const MyHomePage(),
        '/task': (context) => const TaskPage(),
      },
    );
  }
}
