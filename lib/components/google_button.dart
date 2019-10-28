import 'package:flutter/material.dart';

class GoogleButton extends StatelessWidget {
  final Function onPressed;
  
  const GoogleButton({
    @required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width / 12),
      child: Material(
        elevation: 15.0,
        borderRadius: BorderRadius.circular(30.0),
        child: InkWell(
          borderRadius: BorderRadius.circular(30.0),
          onTap: onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Image.asset(
                'assets/images/googleLogo.png',
                scale: 10,
              ),
              Spacer(),
              Text(
                'Continue with Google',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: size.width / 19,
                ),
              ),
              Spacer(),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
