import 'package:flutter/material.dart';
import 'AppTheme.dart';
import 'Login/LoginPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DHCT',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.themeData(),
//      home: DoctorMenuDashboardLayout(),
      home: LoginPage(),
    );
  }
}
