import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';

class Model {
  String? images;
  String? title;

  Model({required this.images, required this.title});
}

Widget buildBoardingPage(Model model) => Column(
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
   const SizedBox(height: 30),
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
);