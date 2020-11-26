import 'package:dhct/Patient/Navigation/Bloc/PatientNavigationBloc.dart';
import 'package:dhct/Values/Colors.dart';
import 'package:dhct/Widgets/CustomAppbar.dart';
import 'package:flutter/material.dart';

class PatientBarcode extends StatefulWidget with PatientNavigationStates {
  final Function onPatientNavMenuIconTap;
  final bool isMenuOpen;

  const PatientBarcode({Key key, this.onPatientNavMenuIconTap, this.isMenuOpen}) : super(key: key);

  @override
  _PatientBarcodeState createState() => _PatientBarcodeState();
}

class _PatientBarcodeState extends State<PatientBarcode> {
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
              ),
            ],
          ),
          CustomAppbar(
            size: size,
            appBarColor: AppColors.appBarColorDark,
            appBarLeadingIconColor: AppColors.appBarDarkIconColor,
            appBarTextColor: AppColors.appBarDarkTextColor,
            appBarTitle: 'My Barcode',
            hasLeadingIcon: true,
            leadingIcon: Icons.menu_rounded,
            leadingIconFunction: widget.onPatientNavMenuIconTap,
          ),
        ],
      ),
    );
  }
}
