import 'package:dhct/Doctor/Navigation/bloc/DoctorNavigationBloc.dart';
import 'package:dhct/Doctor/Screen/PatientDetails.dart';
import 'package:dhct/Values/Colors.dart';
import 'package:dhct/Widgets/CustomAppbar.dart';
import 'package:dhct/Widgets/CustomFAB.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class DoctorMyPatients extends StatefulWidget with DoctorNavigationStates {
  final Function onDoctorNavMenuIconTap;
  final bool isMenuOpen;

  const DoctorMyPatients({Key key, this.onDoctorNavMenuIconTap, this.isMenuOpen}) : super(key: key);

  @override
  _DoctorMyPatientsState createState() => _DoctorMyPatientsState();
}

class _DoctorMyPatientsState extends State<DoctorMyPatients> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.activityBgShadeLight,
      body: Stack(
        children: [
          ListView(
            children: [
              SizedBox(
                height: size.height * 0.15,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PatientDetails()),
                  );
                },
                child: DoctorMyPatientsCard(
                  size: size,
//                  profileImgUrl: 'https://picsum.photos/200',
                  profileImgUrl: 'https://i.pravatar.cc/150?img=68',
                  patientName: 'Keval Makadiya',
                  patientCity: 'Surat',
                  patientWeight: 58,
                  patientAge: 22,
                  patientBloodGroup: 'O Positive',
                  callBtnFunction: null,
                ),
              ),
            ],
          ),
          CustomAppbar(
            size: size,
            appBarColor: AppColors.appBarColorDark,
            appBarLeadingIconColor: AppColors.appBarDarkIconColor,
            appBarTextColor: AppColors.appBarDarkTextColor,
            appBarTitle: 'My Patients',
            leadingIcon: Icons.menu_rounded,
            leadingIconFunction: widget.onDoctorNavMenuIconTap,
            hasLeadingIcon: true,
          ),
        ],
      ),
      floatingActionButton: CustomFAB(
        buttonColor: AppColors.primaryShade2,
        buttonText: 'Add Patient',
        buttonTextColor: AppColors.primaryShade1,
        hasIcon: true,
        buttonIcon: CupertinoIcons.person_add_solid,
        iconColor: AppColors.primaryShade1,
        buttonFunction: () {},
      ),
    );
  }
}

class DoctorMyPatientsCard extends StatelessWidget {
  final Size size;
  final String profileImgUrl;
  final String patientName;
  final String patientCity;
  final int patientWeight;
  final int patientAge;
  final String patientBloodGroup;
  final Function callBtnFunction;

  const DoctorMyPatientsCard({
    Key key,
    @required this.size,
    @required this.profileImgUrl,
    @required this.patientName,
    @required this.patientCity,
    @required this.patientWeight,
    @required this.patientAge,
    @required this.patientBloodGroup,
    @required this.callBtnFunction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
      child: Material(
        borderRadius: BorderRadius.circular(20),
        elevation: 4,
        child: Container(
          width: size.width,
//      height: 150,
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.cardLightColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        minRadius: 25,
                        maxRadius: 25,
                        backgroundImage: NetworkImage(profileImgUrl),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            patientName,
                            style: theme.textTheme.subtitle2.copyWith(
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            patientCity,
                            style: theme.textTheme.bodyText2.copyWith(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  IconButton(
                    icon: Icon(
                      CupertinoIcons.phone,
                      color: AppColors.primaryShade2,
                    ),
                    onPressed: callBtnFunction,
                  ),
                ],
              ),
              SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Icon(
                            FeatherIcons.calendar,
                            size: 14,
                            color: AppColors.primaryShade1,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            'AGE',
                            style: theme.textTheme.subtitle2.copyWith(fontSize: 14),
                          ),
                        ],
                      ),
                      Text(
                        patientAge.toString() + ' Years',
                        style: theme.textTheme.caption.copyWith(
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Icon(
                            CupertinoIcons.gauge,
                            size: 14,
                            color: AppColors.primaryShade1,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            'WEIGHT',
                            style: theme.textTheme.subtitle2,
                          ),
                        ],
                      ),
                      Text(
                        patientWeight.toString() + ' Kg',
                        style: theme.textTheme.caption.copyWith(
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Icon(
                            CupertinoIcons.drop_fill,
                            size: 14,
                            color: AppColors.primaryShade1,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            'BLOOD',
                            style: theme.textTheme.subtitle2,
                          ),
                        ],
                      ),
                      Text(
                        patientBloodGroup,
                        style: theme.textTheme.caption.copyWith(
                          fontSize: 13,
                        ),
                      ),
                    ],
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
