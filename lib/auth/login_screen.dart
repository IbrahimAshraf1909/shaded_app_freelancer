// import 'package:flutter/material.dart';
// import 'package:intl_phone_field/intl_phone_field.dart';
// import 'package:shaded_app_freelancer/_core/enums/requset_state_enums.dart';
// import 'package:shaded_app_freelancer/_core/functions/function.dart';
// import 'package:shaded_app_freelancer/_core/widgets/build_button.dart';
// import 'package:shaded_app_freelancer/_core/widgets/custom_appbar.dart';
// import 'package:shaded_app_freelancer/_core/widgets/custom_snackbar_toast_widget.dart';
// import 'package:shaded_app_freelancer/features/authentication/presentation/bloc/login/login_cubit.dart';
// import 'package:shaded_app_freelancer/features/authentication/presentation/widgets/create_or_widget.dart';
// import 'package:shaded_app_freelancer/main.dart';
// import '../../../user/otp/presentation/pages/otp_screen.dart';
// import '../bloc/login/login_state.dart';
// import '../widgets/create_social_media_circle_widget.dart';

// class LoginPage extends StatefulWidget {
//   const LoginPage({super.key});

//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   @override
//   Widget build(BuildContext context) {
//    return Scaffold(
//             appBar: AppBar(title: const Text("إنشاء حساب"),
//              toolbarHeight: 120,
//               ),
//             body: SingleChildScrollView(
//               child: Form(
//                 key: cubit.formLoginKey,
//                 child: Center(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.only(right: 18.0),
//                         child: Text(
//                           " مرحباً بك 👋",
//                           locale: arabicLocale,
//                           textAlign: TextAlign.right,
//                           style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 18),
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 39,
//                       ),
//                       const Padding(
//                         padding: EdgeInsets.only(right: 34.0),
//                         child: Text(
//                           " أدخل رقم الهاتف للتحقق",
//                           textAlign: TextAlign.right,
//                           style: TextStyle(color: Colors.black54, fontWeight: FontWeight.w500, size: 14),
//                         ),
//                       ),
//                       const SizedBox(height: 14),
//                       Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 25.0),
//                         child: Directionality(
//                           textDirection: TextDirection.ltr,
//                           child: IntlPhoneField(
//                             textAlign: TextAlign.left,
//                             cursorColor: ShadedApp.appColor,
//                             decoration: InputDecoration(
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(14.0),
//                                 borderSide: const BorderSide(),
//                               ),
//                             ),
//                             initialCountryCode: 'PS',
//                             onChanged: (value) {
//                               cubit.phoneLoginController.text == value;
//                             },
//                             controller: cubit.phoneLoginController,
//                             keyboardType: TextInputType.phone,
//                             // onChanged: (dynamic phone) {},
//                             validator: (value) {
//                               if (value!.number.isEmpty) {
//                                 print("Empty");
//                                 return 'برجاء أدخل رقم الهاتف';
//                               } else if (value.number.length != 10) {
//                                 print("مش 12 خانات");
//                                 return 'الرقم غير صحيحاً';
//                               } else if (value.number.startsWith("970") || value.number.startsWith("972")) {
//                                 print("الرقم غلط يسطا");
//                                 return 'الرقم غير صحيحاً';
//                               } else {
//                                 print("ملي يا ابن الناس");
//                                 return null;
//                               }
//                             },
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 39),
//                       Padding(
//                         padding: const EdgeInsets.only(right: 18.0),
//                         child: Row(
//                           children: [
//                             Theme(
//                               data: Theme.of(context).copyWith(unselectedWidgetColor: Colors.grey, primaryColor: appColor),
//                               child: Radio(
//                                 value: 'مستخدم',
//                                 groupValue: cubit.gender.text,
//                                 fillColor: MaterialStatePropertyAll(ShadedApp.appColor),
//                                 onChanged: (dynamic value) {
//                                   // cubit.changeUser(cubit.gender);
//                                   setState(() {
//                                     cubit.gender.text = value;
//                                     print("${cubit.gender.text} Selected");
//                                   });
//                                 },
//                               ),
//                             ),
//                             Text('مستخدم',
//                                 style: TextStyle(
//                                     fontWeight: cubit.gender.text == 'مستخدم' ? FontWeight.bold : FontWeight.w400,
//                                     color: cubit.gender.text == 'مستخدم' ? Colors.black87 : Colors.grey)),
//                             const SizedBox(
//                               width: 20.0,
//                             ),
//                             Theme(
//                               data: Theme.of(context).copyWith(unselectedWidgetColor: Colors.grey, primaryColor: appColor),
//                               child: Radio(
//                                 value: 'كابتن',
//                                 groupValue: cubit.gender.text,
//                                 fillColor: MaterialStatePropertyAll(appColor),
//                                 onChanged: (dynamic value) {
//                                   // cubit.changeUser(cubit.gender);
//                                   setState(() {
//                                     cubit.gender.text = value;
//                                     print("${cubit.gender.text} Selected");
//                                   });
//                                 },
//                               ),
//                             ),
//                             Text('كابتن',
//                                 style: TextStyle(
//                                     fontWeight: cubit.gender.text == 'كابتن' ? FontWeight.bold : FontWeight.w400,
//                                     color: cubit.gender.text == 'كابتن' ? Colors.black87 : Colors.grey)),
//                           ],
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 77,
//                       ),
//                       Center(
//                         child: cubit.phoneLoginController.value.text.length == 9 &&
//                                 (cubit.gender.text == "كابتن" || cubit.gender.text == "مستخدم")
//                             ? state.loginStateLogin == RequestState.loading
//                                 ? const Center(
//                                     child: CircularProgressIndicator(),
//                                   )
//                                 : buildButton(
//                                     color: ShadedApp.appColor,
//                                     colorName: Colors.white,
//                                     name: "أرسل كود التحقق",
//                                     function: () async {
//                                       if (cubit.formLoginKey.currentState!.validate()) {
//                                         cubit.login(context: context);
//                                       }
//                                     })
//                             : buildButton(
//                                 color: Colors.grey,
//                                 colorName: Colors.white,
//                                 name: "أرسل كود التحقق",
//                               ),
//                       ),
//                       createOrWidget(),
//                       createSocialMediaCircleWidget(),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           );
//         }
// }
