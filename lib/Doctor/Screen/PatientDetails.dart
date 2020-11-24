import 'package:dhct/Values/Colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class PatientDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ThemeData theme = Theme.of(context);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: AppColors.primaryShade1));
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.activityBgShadeLight,
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
//                  image: NetworkImage('https://picsum.photos/700/700?grayscale.jpg'),
                  image: NetworkImage('https://i.pravatar.cc/1000?img=68'),
                ),
              ),
              height: size.height * 0.4,
            ),
            Column(
              children: [
                Container(
                  height: size.height * 0.33,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back_rounded,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
//                  height: 150,
                  height: size.height * 0.33,
                  decoration: BoxDecoration(
//                    color: AppColors.activityBgShadeLight,
                    //todo container red color need to be changed
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(60),
                    ),
                  ),
                  child: ListView(
//                    shrinkWrap: true,
                    padding: EdgeInsets.symmetric(vertical: 16),
                    children: [
                      //Container for Name and Call Button
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Keval Makadiya',
                                  style: theme.textTheme.headline5,
                                ),
                                Text(
                                  'Surat, Gujarat.',
                                  style: theme.textTheme.bodyText1.copyWith(
                                    color: AppColors.secondaryShade2,
                                  ),
                                ),
                                Text(
                                  '22 years',
                                  style: theme.textTheme.bodyText1.copyWith(
                                    color: AppColors.secondaryShade2,
                                  ),
                                ),
                              ],
                            ),
                            FloatingActionButton.extended(
                              onPressed: null,
                              label: Text('CALL'),
                              icon: Icon(
                                CupertinoIcons.phone,
                                color: Colors.white,
                              ),
                              backgroundColor: AppColors.primaryShade3,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(5),
                                  bottomRight: Radius.circular(5),
                                  topRight: Radius.circular(25),
                                  bottomLeft: Radius.circular(25),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 16),
                        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
//                        height: size.height * 1.5,
//                        height: 200,
                        decoration: BoxDecoration(
                          color: AppColors.cardLightColor,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                PatientHealthContainerIconWidget(
                                  icon: CupertinoIcons.gauge,
                                  iconColor: AppColors.primaryShade3,
                                  text: '58 Kg',
                                  textColor: AppColors.secondaryShade2,
                                ),
                                PatientHealthContainerIconWidget(
                                  icon: FeatherIcons.droplet,
                                  iconColor: AppColors.primaryShade2,
                                  text: 'O Positive',
                                  textColor: AppColors.secondaryShade2,
                                ),
                                PatientHealthContainerIconWidget(
                                  icon: FeatherIcons.calendar,
                                  iconColor: AppColors.primaryShade3,
                                  text: '22 Years',
                                  textColor: AppColors.secondaryShade2,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class PatientHealthContainerIconWidget extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String text;
  final Color textColor;

  const PatientHealthContainerIconWidget({
    Key key,
    @required this.icon,
    @required this.iconColor,
    @required this.text,
    @required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: iconColor,
        ),
        SizedBox(height: 8),
        Text(
          text,
          style: theme.textTheme.bodyText1.copyWith(
            fontSize: 14,
            color: textColor,
          ),
        ),
      ],
    );
  }
}
