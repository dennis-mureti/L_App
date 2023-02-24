import 'package:flutter/material.dart';
import 'package:lima_app/constants/utils.dart';
import 'package:lima_app/features/auth/screens/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogOutService {
  void logOut(BuildContext context) async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      await sharedPreferences.setString('x-auth-token', '');
      Navigator.pushNamedAndRemoveUntil(
        context,
        LoginScreen.routeName,
        (route) => false,
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
