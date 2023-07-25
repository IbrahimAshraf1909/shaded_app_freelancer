import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shaded_app_freelancer/main.dart';
import 'package:shaded_app_freelancer/user_app/user_home.dart';

class ControePage extends StatelessWidget {
   ControePage({super.key});
  int currentIndex = 0;
  List<Widget> screens = [
    UserHomePage(),
    UserHomePage(),
    UserHomePage(),
    UserHomePage(),
  ];
  List<BottomNavigationBarItem> items = [
    const BottomNavigationBarItem(
        icon: Icon(Icons.home_filled), label: "الرئيسية"),
    const BottomNavigationBarItem(
        icon: Icon(Icons.shopping_bag_rounded), label: "الطلبات"),
    const BottomNavigationBarItem(
        icon: Icon(Icons.message), label: "الرسائل"),
    const BottomNavigationBarItem(
        icon: Icon(Icons.account_circle), label: "بروفايلي")
  ];
  void changeBottomNavBar(index){
    currentIndex = index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
       width:MediaQuery.of(context).size.width,
        child: screens[currentIndex]),
        bottomNavigationBar: BottomNavigationBar(
  backgroundColor: const Color.fromRGBO(250, 250, 250, 1),
              type: BottomNavigationBarType.fixed,
              currentIndex: currentIndex,
        items: items,
        onTap:(index) => changeBottomNavBar(index),
      ),
          floatingActionButton: AvatarGlow(
              endRadius: 60.0,
              shape: BoxShape.circle,
              duration: const Duration(milliseconds: 2000),
              animate: true,
              curve: Curves.easeOutQuad,
              glowColor: ShadedApp.appColor,
              repeat: true,
              showTwoGlows: true,
              repeatPauseDuration: const Duration(milliseconds: 100),
              child: FloatingActionButton.extended(
                onPressed: () {},
                //  Get.to( OptionLayoutPage()),
                backgroundColor: ShadedApp.appColor,
                shape: const CircleBorder(),
                elevation: 0.0,
                label: Center(child: Image.asset('assets/icons/ex-icon-app.png')),
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.miniCenterDocked,
           
    );
  }
}


