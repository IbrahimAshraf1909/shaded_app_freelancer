import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shaded_app_freelancer/user_app/cuntrol_page.dart';

class OnBoardingCubit extends GetxController{

  static final PageController controller = PageController(initialPage: 0);
  bool isLast = false ;
  int pageIndex = 0;

   void checkIndex(int index){
    if(index == 3){
      isLast = true;
    }else{
       isLast = false ;
    }
    print(isLast);
    update();
  }

  void onPressed(context){
    isLast
         ? Get.to(ControePage())
        : 
        controller.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.fastLinearToSlowEaseIn);
        update();
    // emit(OnButtonPressed());
  }

  void onDotPressed(context, index){
    controller
        .animateToPage(index,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut);
        update();
  }


}

