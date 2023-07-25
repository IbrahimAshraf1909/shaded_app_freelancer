import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shaded_app_freelancer/main.dart';
import '../user_app/search_screen.dart';

Widget createSearchField(String searchTitle,{
  bool? isEng,
  VoidCallback? onSubmitted,
}){ 
   return  TextFormField(
      readOnly: true,
      decoration: InputDecoration(
          hintText: searchTitle,
          prefixIcon:  isEng == true? const Icon(Icons.search, color: Color.fromRGBO(118, 127, 157, 1)): null,
          suffixIcon: isEng == false? const Icon(Icons.search, color: Color.fromRGBO(118, 127, 157, 1)): null,
          fillColor: const Color.fromRGBO(252, 252, 253, 1),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14.0),
              borderSide: const BorderSide(color: Colors.black12, width: 2)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14.0),
              borderSide: const BorderSide(color: Colors.black12, width: 2)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14.0),
              borderSide: const BorderSide(color: Colors.black12, width: 2))),
      keyboardType: TextInputType.name,
      textAlign: isEng == true? TextAlign.left: TextAlign.right,
      style: const TextStyle(color: Colors.black87),
      cursorColor: ShadedApp.secondaryAppColor,
      onFieldSubmitted: (value) => onSubmitted,
      onTap: () => Get.to(() => const SearchPage()),
    );
}