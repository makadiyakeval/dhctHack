import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const double screenPadding = 16;

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        height: size.height,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 0,
              left: 0,
              child: Image.asset(
                'asset/images/main_top.png',
                width: size.width * 0.3,
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Image.asset(
                'asset/images/login_bottom.png',
                width: size.width * 0.4,
              ),
            ),
            Positioned(
              child: SafeArea(
                child: Column(
                  children: [
                    Text(
                      'Welcome',
                      style: theme.textTheme.headline5,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
