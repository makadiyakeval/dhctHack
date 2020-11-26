import 'package:dhct/Patient/Navigation/Bloc/PatientNavigationBloc.dart';
import 'package:dhct/Values/Colors.dart';
import 'package:dhct/Widgets/CustomAppbar.dart';
import 'package:flutter/material.dart';

class PatientViewBlog extends StatefulWidget with PatientNavigationStates {
  final Function onPatientNavMenuIconTap;
  final bool isMenuOpen;

  const PatientViewBlog({Key key, this.onPatientNavMenuIconTap, this.isMenuOpen}) : super(key: key);

  @override
  _PatientViewBlogState createState() => _PatientViewBlogState();
}

class _PatientViewBlogState extends State<PatientViewBlog> {
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
            appBarTitle: 'Expert Blog',
            hasLeadingIcon: true,
            leadingIcon: Icons.menu_rounded,
            leadingIconFunction: widget.onPatientNavMenuIconTap,
          ),
        ],
      ),
    );
  }
}
