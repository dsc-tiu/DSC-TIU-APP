import 'package:dsc_tiu/utils/auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          child: Text('Log Out'),
          onPressed: () => Auth().signOut(),
        ),
      ),
    );
  }
}
