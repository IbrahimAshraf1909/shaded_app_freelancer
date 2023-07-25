import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'languages/select_language_screen.dart';

void main() {
  runApp( ShadedApp());
}
class ShadedApp extends StatelessWidget {
   ShadedApp({super.key});

 static Color appColor = const Color.fromRGBO(0, 210, 127, 1);
static Color secondaryAppColor = const Color.fromRGBO(253, 156, 20, 1);


  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      debugShowCheckedModeBanner: false,
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
      home: SelectLanguageScreen(),
    );
  }
}
