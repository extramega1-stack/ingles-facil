import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

class InglesFacilApp extends StatelessWidget {
  const InglesFacilApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Inglés Fácil',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF2563EB)),
      ),
      home: const HomeScreen(),
    );
  }
}
