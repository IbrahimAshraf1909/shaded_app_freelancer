import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../controller/on_boarding_controller.dart';
import '../../languages/language_controler.dart';
import '../../main.dart';

class OnBoardingScreen extends StatelessWidget {
   final LanguageControler getLan = Get.put(LanguageControler());
      final OnBoardingCubit cubit = Get.put(OnBoardingCubit());

List<String> imges = [
   "assets/images/on-boarding-1.svg",
    "assets/images/on-boarding-2.svg",
     "assets/images/on-boarding-3.svg",
];
   OnBoardingScreen({super.key});
   
   void onChanged(int int){
     int +=1 ;
     cubit.checkIndex(int);
  }
  @override
  Widget build(BuildContext context) {
   return Directionality(
    textDirection: getLan.isEn ?TextDirection.ltr : TextDirection.rtl,
     child: Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                toolbarHeight: 120,
                leadingWidth: 80,
                leading: TextButton(
                    onPressed: () {},
                    // => Get.to(const LoginPage()),
                    child:  Text(
                      getLan.getTexts('skip'),
                      style: const TextStyle(fontSize: 14),
                    )),
              ),
              body: SafeArea(
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 5,
                        child: PageView.builder(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          onPageChanged: (index) => onChanged(index),
                          controller: OnBoardingCubit.controller,
                          itemCount: imges.length,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) =>
                             Column(
     mainAxisAlignment: MainAxisAlignment.center,
     crossAxisAlignment: CrossAxisAlignment.center,
     children: [
      Expanded(
        flex: 4,
        child: SvgPicture.asset(
          imges[index].toString(),
          fit: BoxFit.fill,
          alignment: Alignment.center,
          width: double.infinity,
        ),
      ),
      const SizedBox(height: 30),
      Expanded(
        flex: 1,
        child: Text(
          getLan.getTexts('on_boarding')[index],
          textAlign: TextAlign.center,
          style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
        ),
      )
     ],
   ),
   ),
                        ),
                      
                     const SizedBox(height: 30.0),
                      Expanded(
                        flex: 2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                                flex: 1,
                                child: SmoothPageIndicator(
                                  controller: OnBoardingCubit.controller,
                                  count: imges.length,
                                  onDotClicked: (index) =>
                                      cubit.onDotPressed(context, index),
                                  effect: WormEffect(
                                      activeDotColor: ShadedApp.appColor,
                                      radius: 18,
                                      dotWidth: 12,
                                      dotHeight: 12),
                                )),
                           const SizedBox(height: 10),
                            SizedBox(
                              width: 327,
                              child: MaterialButton(
                                onPressed: () => cubit.onPressed(context),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(14.0)),
                                height: 50.0,
                                color: ShadedApp.appColor,
                                child:  Text(
                                  cubit.isLast ? getLan.getTexts('start_now'): getLan.getTexts('next'),
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 16)) ,
                              ),
                            ),
                           const SizedBox(height: 80),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
   );
        }
}
