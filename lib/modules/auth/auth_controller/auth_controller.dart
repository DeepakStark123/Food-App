// ignore_for_file: use_build_context_synchronously, avoid_print

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_app/data/netwoks/baseApiServices.dart';
import 'package:food_app/data/netwoks/networkApiServices.dart';
import 'package:food_app/utils/app_url.dart';
import 'package:food_app/utils/routes/routes_name.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../utils/common_utils.dart/common_utils.dart';

class AuthController extends ChangeNotifier {
  BaseApiServices baseApiServices = NetworkApiServices();
  bool _loading = false;
  get load => _loading;

  //-----------loading status--------
  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  //------------- login api calling -----------------
  Future getLogin(BuildContext context, dynamic body) async {
    setLoading(true);
    try {
      NetworkResponse response =
          await baseApiServices.postApiResponse(context, AppUrl.loginUrl, body);
      print("response = $response");
      if (response.statusCode == 200) {
        Map mapres = jsonDecode(response.body);
        await saveUserToken(mapres['token']);
        Navigator.pushNamedAndRemoveUntil(
            context, RouteName.homeScreen, (route) => false);
      }
      return response;
    } catch (e) {
      print("Exception = $e");
      throw e.toString();
    } finally {
      setLoading(false);
    }
  }

  //------------ SignUp api calling -----------------
  Future getSignUp(BuildContext context, dynamic body) async {
    setLoading(true);
    try {
      NetworkResponse response = await baseApiServices.postApiResponse(
          context, AppUrl.signUpUrl, body);
      print("response = $response");
      if (response.statusCode == 200) {
        Navigator.pop(context);
      }
      return response;
    } catch (e) {
      print("Exception = $e");
      throw e.toString();
    } finally {
      setLoading(false);
    }
  }

  //------------ Save User Token -----------------
  Future saveUserToken(String token) async {
    final SharedPreferences prefer = await SharedPreferences.getInstance();
    prefer.setString("token", token);
  }

  //------------ Get User Token -----------------
  Future getUserToken(BuildContext context) async {
    final SharedPreferences prefer = await SharedPreferences.getInstance();
    var token = prefer.getString("token") ?? '';
    if (token == '' || token.toString() == "null") {
      Navigator.pushNamedAndRemoveUntil(
          context, RouteName.loginScreen, (route) => false);
    } else {
      Navigator.pushNamedAndRemoveUntil(
          context, RouteName.homeScreen, (route) => false);
    }
  }

  //------------ Remove User Token -----------------
  Future removeUserToken() async {
    final SharedPreferences prefer = await SharedPreferences.getInstance();
    await prefer.remove("token");
  }

  //-------------Signing with google------------
  Future googleSignUp(BuildContext context) async {
    try {
      final FirebaseAuth auth = FirebaseAuth.instance;
      // final GoogleSignIn googleSignIn = GoogleSignIn(
      //   scopes: ['email'],
      // );
      GoogleSignIn googleSignIn = GoogleSignIn(
        scopes: [
          'email',
          'https://www.googleapis.com/auth/contacts.readonly',
        ],
      );
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final UserCredential userCredential =
          await auth.signInWithCredential(credential);
      final user = userCredential.user;
      debugPrint(user!.displayName.toString());
      // saveUserToken(credential.accessToken.toString());
      return user;
    } on FirebaseAuthException catch (e) {
      CommonUtils.getAnimatedSnackBar(context, e.toString(), false);
    } catch (e) {
      print("exception = $e");
    }
  }

  //-------------Signing with google------------
  // Future googleSignOut(BuildContext context) async {
  //   try {
  //     final FirebaseAuth auth = FirebaseAuth.instance;
  //     final GoogleSignIn googleSignIn = GoogleSignIn(
  //       scopes: ['email'],
  //     );
  //     final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
  //     final GoogleSignInAuthentication googleAuth =
  //         await googleUser!.authentication;
  //     final AuthCredential credential = GoogleAuthProvider.credential(
  //       accessToken: googleAuth.accessToken,
  //       idToken: googleAuth.idToken,
  //     );
  //     final UserCredential userCredential =
  //         await auth.signInWithCredential(credential);
  //     final user = userCredential.user;
  //     // saveUserToken(credential.accessToken.toString());
  //     return user;
  //   }on FirebaseAuthException catch (e){
  //     CommonUtils.getAnimatedSnackBar(context, e.code.toString(),false);
  //   }catch (e) {
  //     print("exception = $e");
  //   }
  // }

  getUserData(User currentUser, String userName, String userEmail,
      String userimage) async {
    await FirebaseFirestore.instance.collection(currentUser.uid).doc().set({
      "userName": userName,
      "userEmail": userEmail,
      "userImage": userimage,
      "userId": currentUser.uid,
    });
  }
}
