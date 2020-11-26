import 'package:flutter/material.dart';

class PatientDashboard extends StatelessWidget {
  final bool isMenuOpen;
  final double screenWidth;
  final Duration duration;
  final Animation<double> scaleAnimation;
  final Function onNavMenuIconTap;
  final Widget child;

  const PatientDashboard({
    Key key,
    this.isMenuOpen,
    this.screenWidth,
    this.duration,
    this.scaleAnimation,
    this.onNavMenuIconTap,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: duration,
      top: 0,
      bottom: 0,
      left: isMenuOpen ? 0 : 0.6 * screenWidth,
      right: isMenuOpen ? 0 : -0.2 * screenWidth,
      child: ScaleTransition(
        scale: scaleAnimation,
        child: Material(
          animationDuration: duration,
//          color: Colors.yellowAccent,
          borderRadius: BorderRadius.circular(isMenuOpen ? 0 : 40),
          elevation: 16,
          child: child,
        ),
      ),
    );
  }
}
