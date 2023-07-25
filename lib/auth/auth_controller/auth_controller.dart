import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:shaded_app_freelancer/core/api_settings.dart';
import 'package:shaded_app_freelancer/models/login_model.dart';

import '../../models/captain_model.dart';

class AuthController extends Equatable {
  const AuthController._();

  ///============================== > login
  static Future<Either<CaptainModel, LoginUserModel>> login({
    required String phoneNumber,
    required String fcmToken,
    required String deviceType,
    required String userType,
  }) async {
    print('init login');
    Uri uri = Uri.parse(ApiSettings.LOGIN);
    http.Response response = await http.post(uri, body: {
      'mobile': phoneNumber,
      'fcmToken': fcmToken,
      'deviceType': deviceType,
      'userType': userType,
    });

    final data = jsonDecode(response.body);
    print('@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@');
    print(data);
    print(phoneNumber);

    if (userType == '2') {
      return Left(CaptainModel.fromJson(data));
    }
    return Right(LoginUserModel.fromJson(data));
  }

  ///============================== > Register for user
  static Future<LoginUserModel> registerUser({
    required String name,
    required String phone,
    required String userType,
    required String fcmToken,
    required String deviceType,
  }) async {
    Uri uri = Uri.parse(ApiSettings.REGISTER);
    http.Response response = await http.post(uri, body: {
      'name': name,
      'mobile': phone,
      'userType': '1',
      'fcmToken': fcmToken,
      'deviceType': deviceType,
    });

    Map<String, dynamic> data = jsonDecode(response.body);
    return LoginUserModel.fromJson(data);
  }

  ///============================== > Register for captain
  static Future<CaptainModel> registerCaptain({
    required String name,
    required String phone,
    required String userType,
    required String fcmToken,
    required String deviceType,
  }) async {
    Uri uri = Uri.parse(ApiSettings.REGISTER);
    http.Response response = await http.post(uri, body: {
      'name': name,
      'mobile': "$phone",
      'userType': '1',
      'fcmToken': fcmToken,
      'deviceType': deviceType,
    });
    Map<String, dynamic> data = jsonDecode(response.body);
    return CaptainModel.fromJson(data);
  }

  ///============================== > Verify code
  static Future<LoginUserModel> verifyCode({
    required String email,
    required String code,
  }) async {
    Uri uri = Uri.parse(ApiSettings.VERIFYCODE);
    http.Response response = await http.post(uri, body: {
      'email': email,
      'code': code,
    });
    Map<String, dynamic> data = jsonDecode(response.body);
    return LoginUserModel.fromJson(data);
  }

  ///============================== > login using facebook
  // Future<UserCredential> signInWithFacebook() async {
  //   // Trigger the sign-in flow
  //   final LoginResult loginResult = await FacebookAuth.instance.login();
  //
  //   // Create a credential from the access token
  //   final OAuthCredential facebookAuthCredential =
  //       FacebookAuthProvider.credential(loginResult.accessToken!.token);
  //
  //   // Once signed in, return the UserCredential
  //   return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  // }

  ///============================== > login using google
  static Future signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  ///============================== > login using apple
  @override
  List<Object> get props => [];
}
