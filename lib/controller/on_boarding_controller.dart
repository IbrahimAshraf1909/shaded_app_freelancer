import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../auth/login_screen.dart';
import '../models/onBording_model.dart';

class OnBoardingCubit extends GetxController {
  static final PageController controller = PageController(initialPage: 0);
  bool isLast = false;

  int pageIndex = 0;

  void checkIndex(int index) {
    if (index == 3) {
      isLast = true;
    } else {
      isLast = false;
    }
    print(isLast);
    update();
  }

  void onPressed(context) {
    isLast
         ? Get.to(const LoginPage())
        :
    controller.nextPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.fastLinearToSlowEaseIn,
    );
    update();
    // emit(OnButtonPressed());
  }

  void onDotPressed(context, index) {
    controller.animateToPage(index,
        duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
    update();
  }

  static List<Model> model = [
    Model(
        images: "assets/images/on-boarding-1.svg",
        title: "كل شئ تحتاج تنقله أو نوصله \nصا ر بضغطه زر"),
    Model(
        images: "assets/images/on-boarding-2.svg",
        title:
            "حقوقك و منقولاتك بأمان وفر وقتك \nو جهدك و مالك مع ميزة عروض \nالأسعار التنافسية"),
    Model(
        images: "assets/images/on-boarding-3.svg",
        title: " إستثمر وقتك و مركبتك و إنظم إلينا \nاليوم تفيد و تستفيد"),
  ];
}
