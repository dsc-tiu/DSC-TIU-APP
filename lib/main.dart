import 'package:dsc_tiu/config/dark_mode.dart';
import 'package:dsc_tiu/utils/auth.dart';
import 'package:dsc_tiu/utils/data_service.dart';
import 'package:dsc_tiu/utils/dsc_tiu.dart';
import 'package:dsc_tiu/utils/root_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  DSCTIU.prefs = await SharedPreferences.getInstance();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<FirebaseUser>.value(
          value: FirebaseAuth.instance.onAuthStateChanged,
        ),
        ChangeNotifierProvider<Auth>(
          builder: (_) => Auth(),
        ),
        ChangeNotifierProvider<DarkMode>(
          builder: (_) =>
              DarkMode(DSCTIU.prefs.getBool(DSCTIU.darkModePref) ?? false),
        ),
        ChangeNotifierProvider<DataService>(
          builder: (_) => DataService(),
        ),
      ],
      child: RootPage(),
    );
  }
}
