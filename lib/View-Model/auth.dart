import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:nusantara_infrastucture_assessment/Model/login_model.dart';
import 'package:nusantara_infrastucture_assessment/View/home_view.dart';
import 'package:nusantara_infrastucture_assessment/View/login_view.dart';
import 'package:nusantara_infrastucture_assessment/Widgets/transition_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthViewModel with ChangeNotifier {
  DataLogin? _profile;
  DataLogin? get profile => _profile;

  final dio = Dio();
  String url = "https://basic-book-crud-e3u54evafq-et.a.run.app";

  Future<void> login(
      {required String email,
      required String pass,
      required BuildContext context}) async {
    final pref = await SharedPreferences.getInstance();
    try {
      var login = await dio
          .post(url + "/api/login", data: {"email": email, "password": pass});
      if (login.statusCode == 200) {
        LoginModel modeluser = LoginModel.fromJson(login.data);
        final token = modeluser.token;
        pref.setString("token", "$token");
        navReplaceTransition(context, HomePage());
      }
    } catch (e) {}
    notifyListeners();
  }

  Future<void> register(
      {required String email,
      required String name,
      required String pass,
      required String conpass,
      required BuildContext context}) async {
    final pref = await SharedPreferences.getInstance();
    try {
      var register = await dio.post(url + "/api/register", data: {
        "name": name,
        "email": email,
        "password": pass,
        "password_confirmation": conpass
      });
      print(register.statusCode);
      if (register.statusCode == 200) {
        var login = await dio
            .post(url + "/api/login", data: {"email": email, "passowrd": pass});
        if (login.statusCode == 200) {
          LoginModel modeluser = LoginModel.fromJson(login.data);
          final token = modeluser.token;
          pref.setString("token", "$token");
          navReplaceTransition(context, HomePage());
        }
      }
    } catch (e) {}
    notifyListeners();
  }

  Future<void> logout({required BuildContext context}) async {
    final pref = await SharedPreferences.getInstance();
    await pref.remove("token");
    navReplaceTransition(context, Login());
  }
}
