import 'package:dhct/Doctor/Navigation/bloc/DoctorNavigationBloc.dart';
import 'package:dhct/Values/Colors.dart';
import 'package:dhct/Widgets/CustomAppbar.dart';
import 'package:flutter/material.dart';

class DoctorBarcode extends StatefulWidget with DoctorNavigationStates {
  final Function onDoctorNavMenuIconTap;
  final bool isMenuOpen;

  const DoctorBarcode({Key key, this.onDoctorNavMenuIconTap, this.isMenuOpen}) : super(key: key);

  @override
  _DoctorBarcodeState createState() => _DoctorBarcodeState();
}

class _DoctorBarcodeState extends State<DoctorBarcode> {
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
                    Text(
                      'Show this to another person for scanning',
                      textAlign: TextAlign.center,
                      style: theme.textTheme.headline5.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.05,
                    ),
                    Image.asset(
                      'asset/images/qrcode.png',
                      height: size.height * 0.3,
                      width: size.height * 0.3,
                    ),
                  ],
                ),
              )
            ],
          ),
          CustomAppbar(
              size: size,
              theme: theme,
              appBarColor: AppColors.appBarColorDark,
              appBarLeadingIconColor: AppColors.appBarDarkIconColor,
              appBarTextColor: AppColors.appBarDarkTextColor,
              appBarTitle: 'QR Code',
              hasLeadingIcon: true,
              leadingIcon: Icons.menu_rounded,
              leadingIconFunction: widget.onDoctorNavMenuIconTap),
        ],
      ),
    );
  }
}
