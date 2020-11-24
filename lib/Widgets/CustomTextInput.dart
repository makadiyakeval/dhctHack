import 'package:dhct/Values/Colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextInput extends StatefulWidget {
  final String hintText;
  bool isPasswordField;
  final bool hasTrailingIcon;
  final bool hasLeadingIcon;
  final Color backgroundColor;
  final Color iconColor;
  final Color hintTextColor;
  final Color inputTextColor;
  final Color cursorColor;
  final IconData leadingIcon;
  final IconData trailingIcon;

  CustomTextInput({
    Key key,
    @required this.hintText,
    this.isPasswordField = false,
    this.backgroundColor = AppColors.textInputBackground,
    this.iconColor = AppColors.textInputIconColor,
    this.hintTextColor = AppColors.textInputHintColor,
    this.cursorColor = AppColors.textInputCursorColor,
    this.inputTextColor = AppColors.textInputTextColor,
    this.leadingIcon,
    this.trailingIcon,
    this.hasTrailingIcon = false,
    this.hasLeadingIcon = false,
  }) : super(key: key);

  @override
  _CustomTextInputState createState() => _CustomTextInputState();
}

class _CustomTextInputState extends State<CustomTextInput> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      padding: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        onChanged: (input) {},
        obscureText: widget.isPasswordField,
        cursorColor: widget.cursorColor,
        cursorRadius: Radius.circular(20),
        style: theme.textTheme.bodyText1.copyWith(
          color: widget.inputTextColor,
        ),
        decoration: InputDecoration(
          icon: Visibility(
            visible: widget.hasLeadingIcon,
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Icon(
                widget.leadingIcon,
                color: widget.iconColor,
              ),
            ),
          ),
          suffixIcon: Visibility(
            visible: widget.hasTrailingIcon,
            child: Container(
              margin: EdgeInsets.only(right: 10),
              child: IconButton(
                onPressed: () {
                  setState(() {
                    widget.isPasswordField = widget.isPasswordField == true ? false : true;
                  });
                },
                icon: Icon(
                  widget.trailingIcon,
                  color: widget.iconColor,
                ),
              ),
            ),
          ),
          hintText: widget.hintText,
          hintStyle: theme.textTheme.bodyText1.copyWith(
            color: widget.hintTextColor,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
