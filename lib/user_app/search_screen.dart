import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../languages/language_controler.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
         final LanguageControler getLan = Get.put(LanguageControler());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 10,
        title:  TextField(
          textAlign: getLan.isEn == true? TextAlign.left: TextAlign.right,
          decoration: InputDecoration(
            hintText: getLan.getTexts('search'),
            hintStyle: const TextStyle(color: Colors.grey,fontSize: 16),
            fillColor: Colors.grey.shade100,
            filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: Colors.grey.shade100)
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: Colors.grey.shade100)
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: Colors.grey.shade100)
              ),
        ),
      ),
      ),
      body: Directionality(
        textDirection: getLan.isEn ? TextDirection.ltr : TextDirection.rtl,
        child:  SingleChildScrollView(
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      right: 10.0, top: 90.0, bottom: 10.0, left: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        getLan.getTexts('last_searches'),
                        style:
                            const TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                      ),
                      const Icon(Icons.close)
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Text(
                    getLan.getTexts('quick'),
                    style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 14.0),
                  ),
                ),
                const Divider(endIndent: 40, indent: 18),
                const SizedBox(height: 10,),
                 Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Text(
                    getLan.getTexts('tracking'),
                    style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 14.0),
                  ),
                ),
                const Divider(endIndent: 40, indent: 18),
                const SizedBox(height: 10,),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Text(
                   getLan.getTexts('other'),
                    style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 14.0),
                  ),
                ),
                const Divider(endIndent: 40, indent: 18),
                const SizedBox(height: 10,),

                Padding(
                  padding: const EdgeInsets.only(
                      right: 10.0, top: 90.0, bottom: 10.0, left: 10.0),
                  child: Text(
                    getLan.getTexts('popular_services'),
                    style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                  ),
                ),
                const SizedBox(height: 10,),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Text(
                   getLan.getTexts('quick'),
                    style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14.0),
                  ),
                ),
                const SizedBox(height: 10,),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Text(
                    getLan.getTexts('tracking'),
                    style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14.0),
                  ),
                ),
                const SizedBox(height: 10,),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Text(
                   getLan.getTexts('other'),
                    style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14.0),
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
