import 'package:flutter/material.dart';
import 'package:shaded_app_freelancer/_core/theme.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:shaded_app_freelancer/auth/login_screen.dart';
import 'package:get/get.dart';
import '../../../_core/widgets/on_boarding_page.dart';
import 'on_boarding_cubit.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
   return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              toolbarHeight: 120,
              leadingWidth: 80,
              leading: TextButton(
                  onPressed: () => Get.to(const LoginPage()),
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
                      child: Container(
                        child: PageView.builder(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          onPageChanged: (index) => cubit.onChanged(index),
                          controller: cubit.controller,
                          itemCount: cubit.model.length,
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (context, index) =>
                             Column(
  mainAxisAlignment: MainAxisAlignment.center,
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [
    Expanded(
      flex: 4,
      child: SvgPicture.asset(
        "${model.images}",
        fit: BoxFit.fill,
        alignment: Alignment.center,
        width: double.infinity,
      ),
    ),
    SizedBox(height: 30),
    Expanded(
      flex: 1,
      child: Text(
        textAlign: TextAlign.center,
        "${model.title}",
        locale: Locale("ar"),
        style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
      ),
    )
  ],
);),
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
                                controller: cubit.controller,
                                count: cubit.model.length,
                                onDotClicked: (index) =>
                                    cubit.onDotPressed(context, index),
                                effect: WormEffect(
                                    activeDotColor: appColor,
                                    radius: 18,
                                    dotWidth: 12,
                                    dotHeight: 12),
                              )),
                         const SizedBox(height: 10),
                          Container(
                            width: 327,
                            child: MaterialButton(
                              onPressed: () => cubit.onPressed(context),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(14.0)),
                              child: Text( cubit.isLast ? "ابدأ الآن" : "التالي",
                                  style: tajawalArabic(
                                      color: Colors.white, size: 16)),
                              height: 50.0,
                              color: appColor,
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
          );
        }
}
