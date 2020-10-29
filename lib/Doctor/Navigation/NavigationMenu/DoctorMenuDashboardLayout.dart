import 'package:dhct/Doctor/Navigation/NavigationMenu/DoctorDashboard.dart';
import 'package:dhct/Doctor/Navigation/NavigationMenu/DoctorNavMenu.dart';
import 'package:dhct/Doctor/Navigation/bloc/DoctorNavigationBloc.dart';
import 'package:dhct/Doctor/Screen/DoctorBarcode.dart';
import 'package:dhct/Doctor/Screen/DoctorBlog.dart';
import 'package:dhct/Doctor/Screen/DoctorMyPatients.dart';
import 'package:dhct/Doctor/Screen/DoctorProfile.dart';
import 'package:dhct/Values/Colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'DoctorNavMenu.dart';

//const int animDuration = 500;

class DoctorMenuDashboardLayout extends StatefulWidget {
  @override
  _DoctorMenuDashboardLayoutState createState() => _DoctorMenuDashboardLayoutState();
}

class _DoctorMenuDashboardLayoutState extends State<DoctorMenuDashboardLayout> with SingleTickerProviderStateMixin {
  bool isMenuOpen = true;
  double screenHeight, screenWidth;
  final Duration duration = Duration(milliseconds: 500);
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

  void onDoctorMenuItemClicked() {
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
      body: BlocProvider<DoctorNavigationBloc>(
        create: (context) => DoctorNavigationBloc(
          onDoctorNavMenuIconTap: onNavMenuIconTap,
          isMenuOpen: isMenuOpen,
        ),
        child: SafeArea(
          child: Stack(
            children: [
              BlocBuilder<DoctorNavigationBloc, DoctorNavigationStates>(
                builder: (context, navigationState) {
                  return DoctorNavMenu(
                    slideAnimation: _slideAnimation,
                    menuAnimation: _menuScaleAnimation,
                    selectedIndex: getSelectedDoctorNavMenuItemIndex(navigationState),
                    onMenuItemClicked: onDoctorMenuItemClicked,
                  );
                },
              ),
              DoctorDashboard(
                duration: duration,
                onNavMenuIconTap: onNavMenuIconTap,
                scaleAnimation: _scaleAnimation,
                isMenuOpen: isMenuOpen,
                screenWidth: screenWidth,
                child: BlocBuilder<DoctorNavigationBloc, DoctorNavigationStates>(
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

int getSelectedDoctorNavMenuItemIndex(DoctorNavigationStates navigationState) {
  if (navigationState is DoctorProfile) {
    return 0;
  } else if (navigationState is DoctorMyPatients) {
    return 1;
  } else if (navigationState is DoctorBarcode) {
    return 2;
  } else if (navigationState is DoctorBlog) {
    return 3;
  } else {
    return 0;
  }
}
