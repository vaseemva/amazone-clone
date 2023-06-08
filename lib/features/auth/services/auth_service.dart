import 'dart:convert';
import 'dart:developer';

import 'package:amazone_clone/common/widgets/bottom_bar.dart';
import 'package:amazone_clone/constants/error_handling.dart';
import 'package:amazone_clone/constants/global_variables.dart';
import 'package:amazone_clone/constants/utils.dart';
import 'package:amazone_clone/features/home/screens/home_screen.dart';
import 'package:amazone_clone/models/user.dart';
import 'package:amazone_clone/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
        Uri.parse('$uri/api/signup'),
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

//sign in user

  void signInUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      http.Response res = await http.post(
        Uri.parse('$uri/api/signin'),
        body: jsonEncode(
          {"email": email, "password": password},
        ),
        headers: <String, String>{
          "Content-Type": 'application/json;Charset=UTF-8'
        },
      );
      // ignore: use_build_context_synchronously
      httpErrorHandle(
          response: res,
          onSuccess: () async {
            final preferences = await SharedPreferences.getInstance();
            Provider.of<UserProvider>(context, listen: false).setUser(res.body);
            preferences.setString(
                'x-auth-token', jsonDecode(res.body)['token']);
            Navigator.of(context).pushNamedAndRemoveUntil(
              BottomBar.routeName,
              (route) => false,
            );
            showSnackBar(context, 'Signed in successfully');
          },
          context: context);
      log(res.body);
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  void getUser({
    required BuildContext context,
  }) async {
    try {
      final preferences = await SharedPreferences.getInstance();
      String? token = await preferences.getString('x-auth-token');
      if (token == null) {
        preferences.setString('x-auth-token', '');
      }

      var tokenres = await http.post(Uri.parse('$uri/tokenisvalid'),
          headers: <String, String>{
            "Content-Type": 'application/json;Charset=UTF-8',
            "x-auth-token": token!
          });

      var response = jsonDecode(tokenres.body);

      if (response == true) {
        http.Response userRes = await http.get(Uri.parse("$uri/"),
            headers: <String, String>{
              "Content-Type": 'application/json;Charset=UTF-8',
              "x-auth-token": token
            });

        final userProvider = Provider.of<UserProvider>(context, listen: false);
        userProvider.setUser(userRes.body);
      }

      //   http.Response res = await http.post(
      //     Uri.parse('https://91b2-43-229-88-216.in.ngrok.io/api/signin'),
      //     body: jsonEncode(
      //       {"email": email, "password": password},
      //     ),
      //     headers: <String, String>{
      //       "Content-Type": 'application/json;Charset=UTF-8'
      //     },
      //   );
      //   // ignore: use_build_context_synchronously
      //   httpErrorHandle(
      //       response: res,
      //       onSuccess: () async {
      //         final preferences = await SharedPreferences.getInstance();
      //         Provider.of<UserProvider>(context, listen: false).setUser(res.body);
      //         preferences.setString(
      //             'x-auth-token', jsonDecode(res.body)['token']);
      //         Navigator.of(context).pushNamedAndRemoveUntil(
      //           HomeScreen.routeName,
      //           (route) => false,
      //         );
      //         showSnackBar(context, 'Signed in successfully');
      //       },
      //       context: context);
      //   log(res.body);
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
