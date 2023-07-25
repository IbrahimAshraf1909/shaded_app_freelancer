import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shaded_app_freelancer/models/app_color.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../controller/on_boarding_controller.dart';
import '../../main.dart';

class OnBoardingScreen extends StatelessWidget {
   OnBoardingScreen({super.key});

   void onChanged(int int){
     int +=1 ;
     cubit.checkIndex(int);
     print('fun = ${cubit.isLast}');
  }
    var cubit = OnBoardingCubit();
  @override
  Widget build(BuildContext context) {
   return Directionality(
    textDirection: TextDirection.rtl,
     child: Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                toolbarHeight: 120,
                leadingWidth: 80,
                leading: TextButton(
                    onPressed: () {},
                    // => Get.to(const LoginPage()),
                    child: const Text(
                      "تخطي",
                      style: TextStyle(fontSize: 14),
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
                          itemCount: OnBoardingCubit.model.length,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) =>
                             Column(
     mainAxisAlignment: MainAxisAlignment.center,
     crossAxisAlignment: CrossAxisAlignment.center,
     children: [
      Expanded(
        flex: 4,
        child: SvgPicture.asset(
          "${OnBoardingCubit.model[index].images}",
          fit: BoxFit.fill,
          alignment: Alignment.center,
          width: double.infinity,
        ),
      ),
      const SizedBox(height: 30),
      Expanded(
        flex: 1,
        child: Text(
          textAlign: TextAlign.center,
          "${OnBoardingCubit.model[index].title}",
          locale: const Locale("ar"),
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
                                  count: OnBoardingCubit.model.length,
                                  onDotClicked: (index) =>
                                      cubit.onDotPressed(context, index),
                                  effect: WormEffect(
                                      activeDotColor: appColor,
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
                                color: appColor,
                                child: cubit.isLast != false ? const Text(  "ابدأ الآن",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16)) :const Text(  "التالي",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16)),
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
