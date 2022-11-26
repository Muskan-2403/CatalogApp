import 'package:flutter/material.dart';
import 'package:my_first_app/cart_page.dart';
import 'package:my_first_app/util/routes.dart';
import 'package:my_first_app/widgets/theme.dart';

import 'home.dart';
import 'home2.dart';
import 'home3.dart';
import 'loginpage.dart';
// import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // ignore: prefer_const_constructors
      // home: homepage(),
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      debugShowCheckedModeBanner: false,
      initialRoute: MyRoutes.homeRoute,
      routes: {
        "/": (context) => const homePage(),
        MyRoutes.homeRoute: (context) => const homePage(),
        MyRoutes.homeRoute2: (context) => const homePage2(),
        MyRoutes.homeRoute3: (context) => const homePage3(),
        MyRoutes.loginRoute: (context) => const LoginPage(),
        MyRoutes.CartRoute: (context) => const CartPage(),
      },
    );
  }
}
