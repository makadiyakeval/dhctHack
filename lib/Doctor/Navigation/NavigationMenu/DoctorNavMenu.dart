import 'package:dhct/Doctor/Navigation/bloc/DoctorNavigationBloc.dart';
import 'package:dhct/Values/Colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class DoctorNavMenu extends StatelessWidget {
  final Animation<Offset> slideAnimation;
  final Animation<double> menuAnimation;
  final int selectedIndex;
  final Function onMenuItemClicked;

  const DoctorNavMenu({
    Key key,
    this.slideAnimation,
    this.menuAnimation,
    this.selectedIndex,
    @required this.onMenuItemClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ThemeData theme = Theme.of(context);
    return SlideTransition(
      position: slideAnimation,
      child: ScaleTransition(
        scale: menuAnimation,
        child: Padding(
          padding: const EdgeInsets.only(top: 30, bottom: 30, left: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Material(
                    elevation: 16,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(25),
                      bottomLeft: Radius.circular(25),
                    ),
                    child: Container(
                      height: size.width * 0.18,
                      width: size.width * 0.18,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(25),
                          bottomLeft: Radius.circular(25),
                        ),
                        child: Image.network(
                          'https://www.gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50?s=75',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Keval Makadiya',
                              style: theme.textTheme.headline6.copyWith(color: AppColors.secondaryShade1),
                            ),
                            Text(
                              'Flutter Dev',
                              style: theme.textTheme.subtitle2.copyWith(
                                color: AppColors.secondaryShade2,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  NavMenuItem(
                    onMenuItemClicked: onMenuItemClicked,
                    menuItemName: 'My Patients',
                    menuItemIcon: FontAwesomeIcons.userFriends,
                    navigationEvents: DoctorNavigationEvents.DoctorMyPatientClickedEvent,
                    selectedIndex: selectedIndex,
                  ),
                  NavMenuItem(
                    onMenuItemClicked: onMenuItemClicked,
                    menuItemName: 'My Blog',
                    menuItemIcon: FontAwesomeIcons.microblog,
                    navigationEvents: DoctorNavigationEvents.DoctorMyBlogClickedEvent,
                    selectedIndex: selectedIndex,
                  ),
                  NavMenuItem(
                    onMenuItemClicked: onMenuItemClicked,
                    menuItemIcon: FeatherIcons.user,
                    menuItemName: 'My Profile',
                    navigationEvents: DoctorNavigationEvents.DoctorMyProfileClickedEvent,
                    selectedIndex: selectedIndex,
                  ),
                  NavMenuItem(
                    onMenuItemClicked: onMenuItemClicked,
                    menuItemName: 'QR Code',
                    menuItemIcon: Icons.qr_code_rounded,
                    navigationEvents: DoctorNavigationEvents.DoctorBarCodeClickedEvent,
                    selectedIndex: selectedIndex,
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(FeatherIcons.settings, color: AppColors.navMenuItemColor),
                  SizedBox(width: 10),
                  Text(
                    'Settings',
                    style: theme.textTheme.bodyText1.copyWith(
                      color: AppColors.navMenuItemColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    height: 15,
                    width: 2,
                    color: AppColors.navMenuItemColor,
                  ),
                  SizedBox(width: 10),
                  Icon(FeatherIcons.logOut, color: AppColors.navMenuItemColor),
                  SizedBox(width: 10),
                  Text(
                    'Log Out',
                    style: theme.textTheme.bodyText1.copyWith(
                      color: AppColors.navMenuItemColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NavMenuItem extends StatelessWidget {
  final Function onMenuItemClicked;
  final IconData menuItemIcon;
  final String menuItemName;
  final DoctorNavigationEvents navigationEvents;
  final int selectedIndex;

  const NavMenuItem({
    Key key,
    @required this.onMenuItemClicked,
    @required this.menuItemIcon,
    @required this.menuItemName,
    @required this.navigationEvents,
    @required this.selectedIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: GestureDetector(
        onTap: () {
          BlocProvider.of<DoctorNavigationBloc>(context).add(navigationEvents);
          onMenuItemClicked();
        },
        child: Row(
          children: [
            Icon(
              menuItemIcon,
              size: 22,
              color: selectedIndex == navigationEvents.index
                  ? AppColors.navMenuSelectedItemColor
                  : AppColors.navMenuItemColor,
            ),
            SizedBox(width: 20),
            Text(
              menuItemName,
              style: GoogleFonts.montserrat(
                fontSize: 18,
                color: selectedIndex == navigationEvents.index
                    ? AppColors.navMenuSelectedItemColor
                    : AppColors.navMenuItemColor,
                fontWeight: FontWeight.w600,
              ),
            )
          ],
        ),
      ),
    );
  }
}
