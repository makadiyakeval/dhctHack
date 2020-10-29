import 'package:dhct/Doctor/Navigation/bloc/DoctorNavigationBloc.dart';
import 'package:flutter/material.dart';

class DoctorProfile extends StatefulWidget with DoctorNavigationStates {
  final Function onDoctorNavMenuIconTap;
  final bool isMenuOpen;

  const DoctorProfile({Key key, this.onDoctorNavMenuIconTap, this.isMenuOpen}) : super(key: key);

  @override
  _DoctorProfileState createState() => _DoctorProfileState();
}

class _DoctorProfileState extends State<DoctorProfile> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
//        borderRadius: BorderRadius.circular(40),
        color: Colors.purple[400],
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 50, left: 16, right: 16),
        child: Column(
          children: [
            Row(
              children: [
                InkWell(
                  child: Icon(
                    Icons.menu,
                    color: Colors.white,
                  ),
                  onTap: widget.onDoctorNavMenuIconTap,
                ),
                Text("Profile",
                    style: theme.textTheme.headline6.copyWith(
                      color: Colors.white,
                    )),
                Icon(
                  Icons.settings,
                  color: Colors.white,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
