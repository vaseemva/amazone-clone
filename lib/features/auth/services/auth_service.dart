import 'dart:developer';

import 'package:amazone_clone/constants/error_handling.dart';
import 'package:amazone_clone/constants/global_variables.dart';
import 'package:amazone_clone/constants/utils.dart';
import 'package:amazone_clone/models/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthService {
  void signUpUser(
      {required BuildContext context,
      required String email,
      required String password,
      required String name}) async {
    try {
      User user = User(
          id: '',
          name: name,
          email: email,
          address: '',
          type: '',
          password: password,
          token: '');
      http.Response res = await http.post(
        Uri.parse('http://192.168.1.73:3000/api/signup'),
        body: user.toJson(),
        headers: <String, String>{
          "Content-Type": 'application/json;Charset=UTF-8'
        },
      );
      // ignore: use_build_context_synchronously
      httpErrorHandle(
          response: res,
          onSuccess: () {
            showSnackBar(
                context, 'Signed up successfully,Login with same credentials');
          },
          context: context);
      log(res.body);
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
