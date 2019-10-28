import 'package:dsc_tiu/components/google_button.dart';
import 'package:dsc_tiu/utils/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool isLoading = Provider.of<Auth>(context).isLoading;
    return Scaffold(
      body: Center(
        child: isLoading
            ? CircularProgressIndicator()
            : GoogleButton(
                onPressed: () => Auth().googleSignIn(),
              ),
      ),
    );
  }
}
