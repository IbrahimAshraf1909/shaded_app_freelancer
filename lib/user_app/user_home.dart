


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:badges/badges.dart' as badges;
import '../languages/language_controler.dart';
import '../main.dart';
import '../widget/searchField.dart';
import 'notification_screen.dart';


  class UserHomePage extends StatelessWidget {
       final LanguageControler getLan = Get.put(LanguageControler());
    List<String> quickCat = [
      'https://firebasestorage.googleapis.com/v0/b/extreme-99b59.appspot.com/o/catogrys%2Fcar9.png?alt=media&token=1e3d204e-28d0-4d7d-a9ac-11835efc53bd',
      'https://firebasestorage.googleapis.com/v0/b/extreme-99b59.appspot.com/o/catogrys%2Fcar8.png?alt=media&token=4b6344a8-a4fd-4e76-b3ef-fb7b6d18c141',
      'https://firebasestorage.googleapis.com/v0/b/extreme-99b59.appspot.com/o/catogrys%2Fcar7.png?alt=media&token=c8c21d25-a78f-47fa-934f-915de3383d00',
    ];
    List<String> truckCat = [
      'https://firebasestorage.googleapis.com/v0/b/extreme-99b59.appspot.com/o/catogrys%2Fcar6.png?alt=media&token=6ddbb4e5-499b-4381-b7ea-fa85bf0fbd43',
      'https://firebasestorage.googleapis.com/v0/b/extreme-99b59.appspot.com/o/catogrys%2Fcar5.png?alt=media&token=b474a2b8-81da-43db-9595-c7d02bd8d1b9',
      'https://firebasestorage.googleapis.com/v0/b/extreme-99b59.appspot.com/o/catogrys%2Fcar4.png?alt=media&token=06e36801-affc-4ba0-9135-841a6006fe32',
    ];
    List<String> outherCat = [
'https://firebasestorage.googleapis.com/v0/b/extreme-99b59.appspot.com/o/catogrys%2Fcar1.png?alt=media&token=1aecc2f9-35ab-4bed-bda4-a76dfdf1dadc',
'https://firebasestorage.googleapis.com/v0/b/extreme-99b59.appspot.com/o/catogrys%2Fcar2.png?alt=media&token=c55fd43c-3d9b-4c3b-9a9d-cdd3f3b13701',
'https://firebasestorage.googleapis.com/v0/b/extreme-99b59.appspot.com/o/catogrys%2Fcar3.png?alt=media&token=70ffba92-2d99-4ab0-beab-a2010e0d75d7',
    ];
 
   UserHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: getLan.isEn ? TextDirection.ltr : TextDirection.rtl,
      child: SingleChildScrollView(
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 50,),
                      Padding(
                         padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Text(
                          getLan.getTexts('welcome'),
                         
                          textAlign:getLan.isEn ? TextAlign.left : TextAlign.right,
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 18),
                        ),
                      ),      
                       Padding(
                       padding: const EdgeInsets.symmetric(horizontal: 12.0),
    
                        child: Text(
                          getLan.getTexts('the_delivery_be_more_easy'),
                          textAlign:TextAlign.right,

                          style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black87,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(height: 10,),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12.0),
                        child: Row(
                          children: [
                            Expanded(flex: 5, child: Align(
                              alignment:  Alignment.centerLeft,
                              child: createSearchField(getLan.getTexts('search_on_your_order'),isEng: getLan.isEn))),
                            const SizedBox(
                              width: 10.0,
                            ),
                            Expanded(
                              flex: 1,
                              child: badges.Badge(
                                position: getLan.isEn ? badges.BadgePosition.topEnd(top: -13):
                                badges.BadgePosition.topStart(top: -13),
                                showBadge: true,
                                ignorePointer: false,
                                badgeContent: const Padding(
                                  padding: EdgeInsets.all(6.0),
                                  child: Text('3',
                                  
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold)),
                                ),
                                badgeStyle: badges.BadgeStyle(
                                  shape: badges.BadgeShape.circle,
                                  badgeColor: ShadedApp.appColor,
                                  padding: const EdgeInsets.all(5),
                                  elevation: 0,
                                ),
                                child: GestureDetector(
                                  onTap:()=> Get.to(() =>const NotificationPage()),
                                  child: CircleAvatar(
                                      radius: 30,
                                      child: Icon(
                                        Icons.notifications_none_rounded,
                                        color: ShadedApp.appColor,
                                        size: 30,
                                      )),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 10,),
                      Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Text( getLan.getTexts('our_options'),
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 18)),
                      ),
                      const SizedBox(height: 30,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                           Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Text(
                              getLan.getTexts('quick'),
                              textAlign: TextAlign.right,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16),
                            ),
                          ),
                          SizedBox(
                            
                            height: 125.0,
                            width: double.infinity,
                            child: ListView.builder(
                              itemCount: quickCat.length,
                            
                              scrollDirection: Axis.horizontal, 
                               itemBuilder: (ctx,index){
                                return  Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Image(
                                      image: NetworkImage(
                                          quickCat[index]),
                                      height: 70,
                                      fit: BoxFit.cover,
                                      filterQuality: FilterQuality.high,
                                      width: 150),
                                );
                              },
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 30,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:[
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 18.0),
                            child: Text(
                              getLan.getTexts('tracking'),
                              textAlign: TextAlign.right,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16),
                            ),
                          ),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8),
                            height: 125.0,
                            width: double.infinity,
                            child: ListView.builder(
                              itemCount: truckCat.length,
                              scrollDirection: Axis.horizontal, 
                               itemBuilder: (ctx,index){
                                return  Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image(
                                      image: NetworkImage(
                                          truckCat[index]),
                                      height: 70,
                                      fit: BoxFit.cover,
                                      filterQuality: FilterQuality.high,
                                      width: 150,
                                      ),
                                );
                              },
                            ),
                          )
                           ],
                      ),
                      const SizedBox(height: 30,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                           Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 18.0),
                            child: Text(
                              getLan.getTexts('other'),
                              textAlign: TextAlign.right,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16),
                            ),
                          ),
                            Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            height: 125.0,
                            width: double.infinity,
                            child: ListView.builder(
                              itemCount: outherCat.length,
                              scrollDirection: Axis.horizontal,
                               itemBuilder: (ctx,index){
                                return  Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image(
                                      image: NetworkImage(
                                          outherCat[index]),
                                      height: 70,
                                      fit: BoxFit.cover,
                                      filterQuality: FilterQuality.high,
                                      width: 150,
                                      ),
                                );
                              },
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
    );
  }
}