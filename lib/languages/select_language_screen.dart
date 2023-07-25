import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shaded_app_freelancer/main.dart';
import 'package:shaded_app_freelancer/widget/onBoarding/on_boarding_screen.dart';
import 'language_controler.dart';

class SelectLanguageScreen extends StatefulWidget {
   SelectLanguageScreen({super.key});

  @override
  State<SelectLanguageScreen> createState() => _SelectLanguageScreenState();
}

class _SelectLanguageScreenState extends State<SelectLanguageScreen> {
 final LanguageControler getLan = Get.put(LanguageControler());

  @override
  Widget build(BuildContext context) {
      return Scaffold(
              body: Directionality(
                textDirection: getLan.isEn ? TextDirection.ltr : TextDirection.rtl,
                child: SafeArea(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                            flex: 6,
                            child: SvgPicture.asset(
                                'assets/images/select-language.svg')),
                        Expanded(
                            flex: 8,
                            child: Column(
                              children: [
                                 Align(
                                  alignment:getLan.isEn ? Alignment.topLeft : Alignment.topRight,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                                    child: Text(
                                      getLan.getTexts('select_language_app'),
                                      textAlign: getLan.isEn ? TextAlign.start : TextAlign.end,
                                      style: const TextStyle(
                                          fontSize: 18, fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 16.0),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 12.0),
                                  child: CheckboxListTile(
                                    title:  Text(
                                      getLan.getTexts('english'),
                                      style: const TextStyle(fontSize: 18),
                                 
                                    ),
                                    // selected: isEng,
                                    value: 
                                       getLan.isEn,
                                    selectedTileColor: Colors.grey[500],
                                    fillColor: MaterialStatePropertyAll(ShadedApp.appColor),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        side: const BorderSide(
                                            color: Colors.black87, width: 1)),
                                    onChanged: (value) {
                                      setState(() {
                                        
                                       getLan.changeLan(true);
                                      });
                                      
                                    
                                      // cubit.onLanguageChanged(value!).then(
                                      //   (value) => navAndFinish(context, Widget)(context,
                                      //       "/on_boarding_screen.dart.dart"),
                                      // )
                                      // Get.to( OnBoardingScreen())
                                    },
                                  ),
                                ),
                                const SizedBox(height: 20.0),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 12.0),
                                  child: CheckboxListTile(
                                  
                                    title:  Text(
                                      getLan.getTexts('arabic'),
                                      style: const TextStyle(fontSize: 18),
                                   ),
                                    value: !getLan.isEn,
                                    fillColor: MaterialStatePropertyAll(ShadedApp.appColor),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        side: const BorderSide(
                                            color: Colors.black87, width: 1)),
                                    onChanged: (value) {
                                    setState(() {
                                       getLan.changeLan(false);
                                    });
                                      // Get.to(OnBoardingScreen());
                                    },
                                  ),
                                ),
                                const SizedBox(height: 55,),
                                  SizedBox(
                              width: 327,
                              child: MaterialButton(
                                onPressed: () => Get.to(OnBoardingScreen()),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(14.0)),
                                height: 50.0,
                                color: ShadedApp.appColor,
                                child: Text(getLan.getTexts('next'),
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 16)) 
                              ),
                            ),
                        
                              ],
                            )),

                           Expanded(
                            flex: 4,
                            child: Text(
                              getLan.getTexts('change_language_from_settings'),
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 18),
                            )),
                      ],
                    ),
                  ),
                ),
              ),
            );
    }
}