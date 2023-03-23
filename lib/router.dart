import 'package:flutter/material.dart';
import 'package:lima_app/features/auth/screens/register_screen.dart';
import 'package:lima_app/features/superadmin/screens/add_farmer.dart';
import 'package:lima_app/features/superadmin/screens/view_corp.dart';
import 'package:lima_app/features/auth/screens/login_screen.dart';
import 'package:lima_app/features/superadmin/screens/add_corp.dart';
import 'package:lima_app/features/superadmin/screens/dashboard.dart';
import 'package:lima_app/models/getcorp.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case LoginScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const LoginScreen(),
      );
    case RegisterScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const RegisterScreen(),
      );
    case HomeScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const HomeScreen(),
      );
    case AddCorpScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AddCorpScreen(),
      );
    case ViewCorpScreen.routeName:
      // var getCorp = routeSettings.arguments as GetCorp;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const ViewCorpScreen(
            // getCorp: getCorp,
            ),
      );
    case AddFarmerScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AddFarmerScreen(),
      );

    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const Scaffold(
          body: Center(
            child: Text('Screen does not exist'),
          ),
        ),
      );
  }
}
