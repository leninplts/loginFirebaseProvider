import 'package:flutter/material.dart';
import 'package:login/pages/home_page.dart';
import 'package:login/pages/login_page.dart';

var routes = <String, WidgetBuilder>{
  "/auth": (BuildContext context) => LoginPage(),
  "/home": (BuildContext context) => HomePage(),
};
