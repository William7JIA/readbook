import 'package:argon_flutter/screens/admin/dashboard.dart';
import 'package:argon_flutter/screens/login.dart';
import 'package:flutter/material.dart';

// screens
import 'package:argon_flutter/screens/onboarding.dart';
import 'package:argon_flutter/screens/home.dart';
import 'package:argon_flutter/screens/profile.dart';
import 'package:argon_flutter/screens/register.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Toko',
        theme: ThemeData(fontFamily: 'OpenSans'),
        initialRoute: "/home",
        debugShowCheckedModeBanner: false,
        routes: <String, WidgetBuilder>{
          // spalsh screen
          "/onboarding": (BuildContext context) => new Onboarding(),
          "/home": (BuildContext context) => new Home(),
          "/profile": (BuildContext context) => new Profile(),
          "/register": (BuildContext context) => new Register(),
          "/login": (BuildContext context) => new Login(),
          "/dashboad": (BuildContext context) => new Dashboard(),
          "/product": (BuildContext context) => new Dashboard(),
          "/addproduct": (BuildContext context) => new Dashboard(),
        });
  }
}
