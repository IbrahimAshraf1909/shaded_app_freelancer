import 'package:flutter/material.dart';
import 'package:shaded_app_freelancer/user_app/user_home.dart';

void main() {
  runApp( ShadedApp());
}
class ShadedApp extends StatelessWidget {
   ShadedApp({super.key});

  Color appColor = const Color.fromRGBO(0, 210, 127, 1);

Color secondaryAppColor = const Color.fromRGBO(253, 156, 20, 1);


  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ThemeData(
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    elevation: 0.0,
    selectedItemColor: appColor,
    type: BottomNavigationBarType.shifting,
    selectedIconTheme: IconThemeData(color: appColor),
    unselectedIconTheme: const IconThemeData(color: Color.fromRGBO(224, 224, 224, 1)),
    showUnselectedLabels: true,
    showSelectedLabels: true,
    unselectedItemColor: const Color.fromRGBO(224, 224, 224, 1),
    unselectedLabelStyle:
      const  TextStyle(color: Color.fromRGBO(224, 224, 224, 1)),
    selectedLabelStyle: TextStyle(color: appColor),
  ),
  useMaterial3: true,
),
      home:const UserHome(),
    );
  }
}
