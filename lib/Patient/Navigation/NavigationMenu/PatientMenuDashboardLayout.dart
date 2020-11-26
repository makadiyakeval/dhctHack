import 'package:dhct/Patient/Navigation/Bloc/PatientNavigationBloc.dart';
import 'package:dhct/Patient/Navigation/NavigationMenu/PatientDashboard.dart';
import 'package:dhct/Patient/Navigation/NavigationMenu/PatientNavMenu.dart';
import 'package:dhct/Patient/Screen/PatientBarcode.dart';
import 'package:dhct/Patient/Screen/PatientMyDocument.dart';
import 'package:dhct/Patient/Screen/PatientProfile.dart';
import 'package:dhct/Patient/Screen/PatientTracing.dart';
import 'package:dhct/Patient/Screen/PatientViewBlog.dart';
import 'package:dhct/Values/Colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//const int animDuration = 500;

class PatientMenuDashboardLayout extends StatefulWidget {
  @override
  _PatientMenuDashboardLayoutState createState() => _PatientMenuDashboardLayoutState();
}

class _PatientMenuDashboardLayoutState extends State<PatientMenuDashboardLayout> with SingleTickerProviderStateMixin {
  bool isMenuOpen = true;
  double screenHeight, screenWidth;
  //todo duration Changed from 500 to 300
  final Duration duration = Duration(milliseconds: 300);
  AnimationController _animationController;
  Animation<double> _scaleAnimation;
  Animation<double> _menuScaleAnimation;
  Animation<Offset> _slideAnimation;

  @override
  void initState() {
    _animationController = AnimationController(vsync: this, duration: duration);
    _scaleAnimation = Tween<double>(begin: 1, end: 0.8).animate(_animationController);
    _menuScaleAnimation = Tween<double>(begin: 0.5, end: 1).animate(_animationController);
    _slideAnimation = Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0)).animate(_animationController);
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void onNavMenuIconTap() {
    setState(() {
      if (isMenuOpen) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
      isMenuOpen = !isMenuOpen;
    });
  }

  void onPatientMenuItemClicked() {
    setState(() {
      _animationController.reverse();
    });
    isMenuOpen = !isMenuOpen;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenWidth = size.width;
    screenHeight = size.height;
    return Scaffold(
      backgroundColor: AppColors.primaryShade1,
      body: BlocProvider<PatientNavigationBloc>(
        create: (context) => PatientNavigationBloc(
          onPatientNavMenuIconTap: onNavMenuIconTap,
          isMenuOpen: isMenuOpen,
        ),
        child: SafeArea(
          child: Stack(
            children: [
              BlocBuilder<PatientNavigationBloc, PatientNavigationStates>(
                builder: (context, navigationState) {
                  return PatientNavMenu(
                    slideAnimation: _slideAnimation,
                    menuAnimation: _menuScaleAnimation,
                    selectedIndex: getSelectedPatientNavMenuItemIndex(navigationState),
                    onMenuItemClicked: onPatientMenuItemClicked,
                  );
                },
              ),
              PatientDashboard(
                duration: duration,
                onNavMenuIconTap: onNavMenuIconTap,
                scaleAnimation: _scaleAnimation,
                isMenuOpen: isMenuOpen,
                screenWidth: screenWidth,
                child: BlocBuilder<PatientNavigationBloc, PatientNavigationStates>(
                  builder: (context, navigationState) {
                    return Container(
                      child: navigationState as Widget,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

int getSelectedPatientNavMenuItemIndex(PatientNavigationStates navigationState) {
  if (navigationState is PatientMyDocuments) {
    return 0;
  } else if (navigationState is PatientViewBlog) {
    return 1;
  } else if (navigationState is PatientTracing) {
    return 2;
  } else if (navigationState is PatientProfile) {
    return 3;
  } else if (navigationState is PatientBarcode) {
    return 4;
  } else {
    return 0;
  }
}
