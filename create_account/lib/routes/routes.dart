import 'package:create_account/pages/signin.dart';
import 'package:flutter/material.dart';

class Routes {
  static Map<String, Widget Function(BuildContext)> routes = {
    '/': (BuildContext context) => const SignIn(),
  };
}
