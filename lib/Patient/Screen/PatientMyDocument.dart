import 'package:dhct/Patient/Navigation/Bloc/PatientNavigationBloc.dart';
import 'package:dhct/Values/Colors.dart';
import 'package:dhct/Widgets/CustomAlertDialog.dart';
import 'package:dhct/Widgets/CustomAppbar.dart';
import 'package:flutter/material.dart';

class PatientMyDocuments extends StatefulWidget with PatientNavigationStates {
  final Function onPatientNavMenuIconTap;
  final bool isMenuOpen;

  const PatientMyDocuments({Key key, this.onPatientNavMenuIconTap, this.isMenuOpen}) : super(key: key);

  @override
  _PatientMyDocumentsState createState() => _PatientMyDocumentsState();
}

class _PatientMyDocumentsState extends State<PatientMyDocuments> {
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
                    SizedBox(
                      height: size.height * 0.2,
                    ),
                    RaisedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext build) {
                            return CustomAlertDialog(
                              dialogContent: 'This is Content Line',
                              dialogTitle: 'Title',
                              hasNegativeAction: true,
                              hasPositiveAction: true,
                            );
                          },
                        );
                      },
                      child: Text('Hello'),
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
            appBarTitle: 'My Documents',
            hasLeadingIcon: true,
            leadingIcon: Icons.menu_rounded,
            leadingIconFunction: widget.onPatientNavMenuIconTap,
          ),
        ],
      ),
    );
  }
}
