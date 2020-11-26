import 'package:dhct/Patient/Navigation/Bloc/PatientNavigationBloc.dart';
import 'package:dhct/Values/Colors.dart';
import 'package:dhct/Widgets/CustomAppbar.dart';
import 'package:flutter/material.dart';

class PatientProfile extends StatefulWidget with PatientNavigationStates {
  final Function onPatientNavMenuIconTap;
  final bool isMenuOpen;

  const PatientProfile({Key key, this.onPatientNavMenuIconTap, this.isMenuOpen}) : super(key: key);

  @override
  _PatientProfileState createState() => _PatientProfileState();
}

class _PatientProfileState extends State<PatientProfile> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ThemeData theme = Theme.of(context);
    return Scaffold(
      body: Stack(
        children: [
          ListView(
            children: [
              SizedBox(
                height: size.height * 0.15,
              ),
              Container(
                child: Column(
                  children: [
                    SizedBox(
                      height: size.height * 0.05,
                    ),
                  ],
                ),
              )
            ],
          ),
          CustomAppbar(
            size: size,
            appBarColor: AppColors.appBarColorDark,
            appBarLeadingIconColor: AppColors.appBarDarkIconColor,
            appBarTextColor: AppColors.appBarDarkTextColor,
            appBarTitle: 'My Profile',
            hasLeadingIcon: true,
            leadingIcon: Icons.menu_rounded,
            leadingIconFunction: widget.onPatientNavMenuIconTap,
          ),
        ],
      ),
    );
  }
}
