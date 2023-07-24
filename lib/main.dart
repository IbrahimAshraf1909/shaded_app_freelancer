import 'package:flutter/material.dart';
import 'package:shaded_app_freelancer/user_app/user_home.dart';

void main() {
  runApp(const ShadedApp());
}
class ShadedApp extends StatelessWidget {
  const ShadedApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: UserHome(),
    );
  }
}
