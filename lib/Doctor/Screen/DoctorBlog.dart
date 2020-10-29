import 'package:dhct/Doctor/Navigation/bloc/DoctorNavigationBloc.dart';
import 'package:flutter/material.dart';

class DoctorBlog extends StatefulWidget with DoctorNavigationStates {
  final Function onDoctorNavMenuIconTap;
  final bool isMenuOpen;

  const DoctorBlog({Key key, this.onDoctorNavMenuIconTap, this.isMenuOpen}) : super(key: key);

  @override
  _DoctorBlogState createState() => _DoctorBlogState();
}

class _DoctorBlogState extends State<DoctorBlog> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
//        borderRadius: BorderRadius.circular(40),
        color: Colors.cyan[400],
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
                Text("My Blog",
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
