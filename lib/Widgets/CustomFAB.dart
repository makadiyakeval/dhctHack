import 'package:dhct/Values/Colors.dart';
import 'package:flutter/material.dart';

class CustomFAB extends StatelessWidget {
  final String buttonText;
  final Color buttonTextColor;
  final Color buttonColor;
  final bool hasIcon;
  final IconData buttonIcon;
  final Color iconColor;
  final Function buttonFunction;

  const CustomFAB({
    Key key,
    @required this.buttonText,
    this.buttonColor = AppColors.primaryShade2,
    this.buttonIcon,
    this.iconColor,
    this.hasIcon = false,
    @required this.buttonFunction,
    @required this.buttonTextColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return FloatingActionButton.extended(
      label: Text(
        buttonText,
        style: theme.textTheme.button.copyWith(color: buttonTextColor),
      ),
      icon: Visibility(
        visible: hasIcon,
        child: Icon(
          buttonIcon,
          size: 22,
          color: iconColor,
        ),
      ),
      backgroundColor: buttonColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(5),
          bottomRight: Radius.circular(5),
          topRight: Radius.circular(25),
          bottomLeft: Radius.circular(25),
        ),
      ),
      onPressed: buttonFunction,
    );
  }
}
