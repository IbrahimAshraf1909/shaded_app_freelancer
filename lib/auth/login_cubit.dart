// import 'dart:io';

// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/widgets.dart';
// import 'package:get/get.dart';
// import 'package:shaded_app_freelancer/_core/api/api_settings.dart';
// import 'package:shaded_app_freelancer/_core/enums/requset_state_enums.dart';
// import 'package:shaded_app_freelancer/_core/shared_preferenced/shared_preferenced.dart';
// import 'package:dio/dio.dart';
// import 'package:shaded_app_freelancer/_core/widgets/custom_snackbar_toast_widget.dart';
// import 'package:shaded_app_freelancer/features/User/layout/presentation/pages/home_screen.dart';
// import 'package:shaded_app_freelancer/features/captain/layout/presentation/pages/home_screen.dart';
// import 'package:shaded_app_freelancer/features/user/otp/presentation/pages/otp_screen.dart';
// import 'package:shaded_app_freelancer/features/user/signup/presentation/pages/signup_screen.dart';

// import '../../../../../_core/functions/function.dart';
// import '../../../../captain/signup/data/models/captian_model.dart';
// import '../../../../captain/signup/presentation/pages/signup_screen.dart';
// import '../../../../user/layout/presentation/pages/layout_screen.dart';
// import '../../../controllers/auth_controller/auth_controller.dart';
// import '../../../models/user_models/user_model.dart';
// import 'login_state.dart';

// class LoginCubit extends GetxController {

//   static LoginCubit get(context) => BlocProvider.of(context, listen: false);
//   TextEditingController gender = TextEditingController();
//   final formLoginKey = GlobalKey<FormState>();

//   ///======================================== > Otp
//   // ignore: non_constant_identifier_names
//   TextEditingController OtpController = TextEditingController();
//   final formKey = GlobalKey<FormState>();

//   ///======================================== > End Otp
//   TextEditingController phoneLoginController = TextEditingController();

//   Future<void> login({required BuildContext context}) async {
//     String phone = phoneLoginController.text;
//     String? fcmToken = await FirebaseMessaging.instance.getToken();
//     String deviceType = Platform.isAndroid ? 'android' : 'ios';
//     emit(LoginProgressState(loginState: RequestState.loading));

//     await AuthController.login(
//       phoneNumber: phone,
//       fcmToken: fcmToken ?? "Ana token hhh XD",
//       deviceType: deviceType,
//       userType: gender.text == 'مستخدم' ? '1' : '2',
//     ).then((value) {
//       value.fold(
//         (CaptainModel captainModel) {
//           print(captainModel.status);
//           if (captainModel.status && captainModel.data != null) {
//             final model = captainModel.data!;

//             SharedPrefController().saveDriver(user: captainModel.data!).then((_) {
//               if (model.status.name == 'active') {
//                 navTo(
//                   context,
//                   UserHomeLayout(),
//                 );
//               } else {
//                 navTo(
//                   context,
//                   OtpPage(
//                     phoneNumber: "0$phone",
//                     otpCode: model.code,
//                     userType: '2',
//                   ),
//                 );
//               }
//             });
//           } else {
//             navTo(
//                 context,
//                 CaptainSignupPage(
//                   phoneNumber: '0$phone',
//                 ));
//           }
//         },
//         (LoginUserModel LoginUserModel) {
//           if (LoginUserModel.status && LoginUserModel.data != null) {
//             SharedPrefController().saveUser(user: LoginUserModel.data!).then((value) {
//               final model = LoginUserModel.data!;
//               navTo(
//                 context,
//                 OtpPage(
//                   phoneNumber: "0$phone",
//                   otpCode: model.code,
//                   userType: '1',
//                 ),
//               );
//             });
//           } else {
//             navTo(context, UserSignupPage());
//           }
//         },
//       );
//       emit(LoginProgressState(loginState: RequestState.done));
//     }).catchError((e, stackTrace) {
//       emit(LoginProgressState(loginState: RequestState.error));
//       print('Error occurred: $e\n$stackTrace');
//     });
//     // result.fold(
//     //   (captain) {
//     //     SharedPrefController().saveDriver(user: captain.data!);
//     //     emit(CaptainLoginSuccess(fcmToken!, deviceType, "كابتن", captain));
//     //   },
//     //   (user) {
//     //     SharedPrefController().saveUser(user: user.data!).then((_) {
//     //       emit(UserLoginSuccess(fcmToken!, deviceType, "مستخدم", user));
//     //     });
//     //   },
//     // );
//   }



//   ///================================================ >
// }
