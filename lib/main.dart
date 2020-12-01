import 'package:dhct/LoginRegisteration/RegistrationPage.dart';
import 'package:dhct/Patient/Navigation/NavigationMenu/PatientMenuDashboardLayout.dart';
import 'package:flutter/material.dart';
import 'AppTheme.dart';
import 'Doctor/Navigation/NavigationMenu/DoctorMenuDashboardLayout.dart';

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
//      home: PatientMenuDashboardLayout(),
      home: RegisterationPage(),
    );
  }
}
