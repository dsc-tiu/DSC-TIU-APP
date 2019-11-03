import 'package:dsc_tiu/utils/dsc_tiu.dart';
import 'package:flutter/widgets.dart';

class DarkMode extends ChangeNotifier {
  bool isDarkModeOn;
  DarkMode(this.isDarkModeOn);

  void changeTheme() async {
    try {
      isDarkModeOn = !isDarkModeOn;
      await DSCTIU.prefs.setBool(DSCTIU.darkModePref, isDarkModeOn);
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}
