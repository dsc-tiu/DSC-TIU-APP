import 'package:dsc_tiu/config/dark_mode.dart';
import 'package:dsc_tiu/screens/home_page.dart';
import 'package:dsc_tiu/screens/sign_in_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RootPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool isLoggedIn = Provider.of<FirebaseUser>(context) != null;
    bool isDarkModeOn = Provider.of<DarkMode>(context).isDarkModeOn;
    return MaterialApp(
      // debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Roboto',
        brightness: isDarkModeOn ? Brightness.dark : Brightness.light,
      ),
      home: isLoggedIn ? HomePage() : SignInPage(),
    );
  }
}