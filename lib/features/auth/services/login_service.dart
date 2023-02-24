import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lima_app/constants/error_handling.dart';
import 'package:lima_app/constants/global_variables.dart';
import 'package:lima_app/constants/utils.dart';
import 'package:lima_app/features/superadmin/screens/home_screen.dart';
import 'package:lima_app/providers/user_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

class LoginService {
  void loginUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      http.Response res = await http.post(
        Uri.parse('$uri/users/login'),
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () async {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          Provider.of<UserProvider>(context, listen: false).setUser(res.body);
          await prefs.setString('', jsonDecode(res.body)['access_token']);
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => const HomeScreen())
                  // context,
                  // HomeScreen.routeName,
                  // (route) => true,
                  );
        },
      );
    } catch (e) {
      // print(e);
      showSnackBar(context, e.toString());
    }
  }
}
