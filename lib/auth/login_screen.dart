import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:shaded_app_freelancer/assets_names/assets.dart';
import 'package:shaded_app_freelancer/auth/auth_controller/auth_controller.dart';
import 'package:shaded_app_freelancer/auth/login_controller.dart';
import 'package:shaded_app_freelancer/main.dart';
import 'package:shaded_app_freelancer/models/app_color.dart';
import 'package:shaded_app_freelancer/widget/app_services/app_text.dart';
import 'package:shaded_app_freelancer/widget/public_widgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());
    return GetBuilder<LoginController>(
      builder: (logic) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            appBar: AppBar(
              title: const Text("إنشاء حساب"),
              toolbarHeight: 120,
            ),
            body: SingleChildScrollView(
              child: Form(
                key: logic.formLoginKey,
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 18.0),
                        child: Text(
                          " مرحباً بك 👋",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 39,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(right: 34.0),
                        child: Text(
                          " أدخل رقم الهاتف للتحقق",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      const SizedBox(height: 14),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: TextFormField(
                          controller: logic.phoneLoginController,
                          keyboardType: TextInputType.phone,
                          onChanged: (value) {
                            if (logic.formLoginKey.currentState!.validate() &&
                                logic.gender.text == 'مستخدم' &&
                                logic.gender.text == 'كابتن') {
                            } else {
                              setState(() {});
                            }
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              print("Empty");
                              return 'برجاء أدخل رقم الهاتف';
                            } else if (value.length != 9 ||
                                !value.isPhoneNumber) {
                              print(value.length);
                              return 'الرقم غير صحيح';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            prefix: const Text('+966  '),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14.0),
                              borderSide: const BorderSide(),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 39),
                      Padding(
                        padding: const EdgeInsets.only(right: 18.0),
                        child: Row(
                          children: [
                            Theme(
                              data: Theme.of(context).copyWith(
                                  unselectedWidgetColor: Colors.grey,
                                  primaryColor: Color.fromRGBO(0, 210, 127, 1)),
                              child: Radio(
                                value: 'مستخدم',
                                groupValue: logic.gender.text,
                                fillColor: MaterialStatePropertyAll(
                                  appColor,),
                                onChanged: (dynamic value) {
                                  // cubit.changeUser(cubit.gender);
                                  setState(() {
                                    logic.gender.text = value;
                                    print("${logic.gender.text} Selected");
                                  });
                                },
                              ),
                            ),
                            Text('مستخدم',
                                style: TextStyle(
                                    fontWeight: logic.gender.text == 'مستخدم'
                                        ? FontWeight.bold
                                        : FontWeight.w400,
                                    color: logic.gender.text == 'مستخدم'
                                        ? Colors.black87
                                        : Colors.grey)),
                            const SizedBox(
                              width: 20.0,
                            ),
                            Theme(
                              data: Theme.of(context).copyWith(
                                unselectedWidgetColor: Colors.grey,
                              ),
                              child: Radio(
                                fillColor: MaterialStatePropertyAll(
                                  appColor,),
                                activeColor: appColor,
                                value: 'كابتن',
                                groupValue: logic.gender.text,
                                // fillColor: MaterialStatePropertyAll(appColor),
                                onChanged: (dynamic value) {
                                  // cubit.changeUser(cubit.gender);
                                  setState(() {
                                    logic.gender.text = value;
                                    print("${logic.gender.text} Selected");
                                  });
                                },
                              ),
                            ),
                            Text('كابتن',
                                style: TextStyle(
                                    fontWeight: logic.gender.text == 'كابتن'
                                        ? FontWeight.bold
                                        : FontWeight.w400,
                                    color: logic.gender.text == 'كابتن'
                                        ? Colors.black87
                                        : Colors.grey)),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 77,
                      ),
                      Center(
                        child:
                            logic.phoneLoginController.value.text.length == 9 &&
                                    (logic.gender.text == "كابتن" ||
                                        logic.gender.text == "مستخدم")
                                ? logic.isLoading
                                    ? const Center(
                                        child: CircularProgressIndicator(),
                                      )
                                    : buildButton(
                                        color: appColor,
                                        colorName: Colors.white,
                                        name: "أرسل كود التحقق",
                                        function: () async {
                                          if (logic.formLoginKey.currentState!
                                              .validate()) {

                                            print('pihpn');
                                            logic.login(context: context);
                                          }
                                        })
                                : buildButton(
                                    color: Colors.grey,
                                    colorName: Colors.white,
                                    name: "أرسل كود التحقق",
                                  ),
                      ),
                      // createOrWidget(),
                      // createSocialMediaCircleWidget(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

Widget createSocialMediaCircleWidget() => Padding(
    padding: const EdgeInsets.symmetric(
      horizontal: 20,
      vertical: 10,
    ),
    child: GestureDetector(
      onTap: () async {
        await AuthController.signInWithGoogle();
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(8),
        ),
        width: double.infinity,
        height: 60,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText('Google', 14, Colors.white),
              space_w(15),
              SvgPicture.asset(Assets.iconsGoogle),
            ],
          ),
        ),
      ),
    ));

Widget createOrWidget() => Column(
      children: [
        const SizedBox(
          height: 77,
        ),
        Row(children: [
          const SizedBox(
            width: 55.0,
          ),
          const Expanded(child: Divider(color: Colors.black87)),
          const SizedBox(
            width: 16.0,
          ),
          Text(
            "أو تسجيل الدخول عبر",
            style: tajawalArabic(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            width: 16.0,
          ),
          const Expanded(child: Divider(color: Colors.black87)),
          const SizedBox(
            width: 55.0,
          ),
        ]),
        const SizedBox(
          height: 30,
        ),
      ],
    );

Widget space_w(double width) {
  return SizedBox(
    width: width,
  );
}

Widget space_h(double height) {
  return SizedBox(
    height: height,
  );
}

Widget buildButton({
  String? name,
  Color? color,
  Color? colorName,
  double? width,
  double? hight,
  VoidCallback? function,
}) =>
    SizedBox(
      width: width ?? 327,
      height: hight ?? 50,
      child: MaterialButton(
        elevation: 0,
        onPressed: function ?? () {},
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(14.0)),
        child: Text(name!, style: tajawalArabic(color: colorName, size: 16)),
        color: color,
      ),
    );
