import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget {
  final Size size;
  final Color appBarColor;
  final Color appBarLeadingIconColor;
  final Color appBarTrailingIconColor;
  final Color appBarTextColor;
  final String appBarTitle;
  final bool hasTrailingIcon;
  final bool hasLeadingIcon;
  final IconData leadingIcon;
  final IconData trailingIcon;
  final Function leadingIconFunction;
  final Function trailingIconFunction;

  const CustomAppbar({
    Key key,
    @required this.size,
    @required this.theme,
    @required this.appBarColor,
    @required this.appBarLeadingIconColor,
    @required this.appBarTextColor,
    @required this.appBarTitle,
    @required this.hasLeadingIcon,
    @required this.leadingIcon,
    @required this.leadingIconFunction,
    this.appBarTrailingIconColor,
    this.hasTrailingIcon = false,
    this.trailingIcon,
    this.trailingIconFunction,
  }) : super(key: key);

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 16,
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(75),
      ),
      child: Container(
        height: size.height * 0.14,
        width: size.width,
        decoration: BoxDecoration(
//        boxShadow: <BoxShadow>[
//          BoxShadow(
//            color: Colors.black54,
//            blurRadius: 15.0,
//            offset: Offset(0.0, 0.75),
//          ),
//        ],
          color: appBarColor,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(75),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Visibility(
                      visible: hasLeadingIcon,
                      child: InkWell(
                        child: Icon(
                          leadingIcon,
                          color: appBarLeadingIconColor,
                        ),
                        onTap: leadingIconFunction,
                      ),
                    ),
                    Visibility(
                      visible: hasTrailingIcon,
                      child: InkWell(
                        child: Icon(
                          trailingIcon,
                          color: appBarTrailingIconColor,
                        ),
                        onTap: trailingIconFunction,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 44,
                top: 16,
              ),
              child: Text(
                appBarTitle,
                style: theme.textTheme.headline5.copyWith(
                  color: appBarTextColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
