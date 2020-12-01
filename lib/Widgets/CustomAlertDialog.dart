import 'package:dhct/Values/Colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class CustomAlertDialog extends StatelessWidget {
  final String dialogTitle;
  final String dialogContent;
  final Function negativeActionFunction;
  final Function positiveActionFunction;
  final bool hasNegativeAction;
  final bool hasPositiveAction;

  const CustomAlertDialog({
    Key key,
    @required this.dialogTitle,
    @required this.dialogContent,
    this.negativeActionFunction,
    this.positiveActionFunction,
    this.hasNegativeAction = false,
    this.hasPositiveAction = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(59),
          bottomLeft: Radius.circular(59),
        ),
      ),
      backgroundColor: AppColors.primaryShade1,
      title: Text(
        dialogTitle,
        style: theme.textTheme.headline6.copyWith(
          color: AppColors.dialogTitleLight,
        ),
      ),
      content: Text(
        dialogContent,
        style: theme.textTheme.bodyText2.copyWith(
          color: AppColors.dialogBodyTextLight,
          height: 1.4,
        ),
      ),
      insetPadding: EdgeInsets.symmetric(horizontal: 36),
      actionsPadding: EdgeInsets.only(right: 8),
      actions: [
        Visibility(
          visible: hasNegativeAction,
          child: FloatingActionButton(
            onPressed: negativeActionFunction,
            backgroundColor: AppColors.dialogNegativeButton,
            child: Icon(FeatherIcons.x),
            mini: true,
          ),
        ),
        Visibility(
          visible: hasPositiveAction,
          child: FloatingActionButton(
            onPressed: positiveActionFunction,
            backgroundColor: AppColors.dialogPositiveButton,
            child: Icon(FeatherIcons.check),
            mini: true,
          ),
        ),
      ],
    );
  }
}

/// This method can help to show the dialog
//showDialog(
//context: context,
//builder: (BuildContext build) {
//return CustomAlertDialog(
//dialogContent: 'This is Content Line',
//dialogTitle: 'Title',
//hasNegativeAction: true,
//hasPositiveAction: true,
//);
//},
//);
