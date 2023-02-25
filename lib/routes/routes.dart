import 'package:flutter/material.dart';
import 'package:weparent/view//ResetPassword/enteremail_screen.dart';
import 'package:weparent/view//login/login_screen.dart';
import 'package:weparent/view//signup/signup_screen.dart';
import 'package:weparent/view//welcome/welcome_screen.dart';



final Map<String, WidgetBuilder> routes = {
  '/': (context) => const WelcomeScreen(),
  '/login': (context) => SignIn(),
  '/register': (context) => SignUp(),
  '/email': (context) => EnterEmail(),
  '/otp': (context) => EnterEmail(),
};
