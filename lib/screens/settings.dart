import 'package:dsc_tiu/config/dark_mode.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DarkMode darkMode = Provider.of<DarkMode>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('Enable Dark Mode'),
            subtitle: Text('Gives a Darker theme to the app'),
            leading: Icon(Icons.brightness_6),
            trailing: CupertinoSwitch(
              value: darkMode.isDarkModeOn,
              onChanged: (val) => darkMode.changeTheme(),
            ),
          )
        ],
      )
    );
  }
}