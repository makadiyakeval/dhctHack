import 'package:dhct/LoginRegisteration/LoginPage.dart';
import 'package:dhct/Values/Colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class RegisterationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
//      backgroundColor: Colors.white,
      body: Container(
//        width: size.width,
        height: size.height,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 0,
              left: 0,
              child: Image.asset(
                'asset/images/signup_top.png',
                width: size.width * 0.3,
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: Image.asset(
                'asset/images/main_bottom.png',
                width: size.width * 0.3,
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Image.asset(
                'asset/images/login_bottom.png',
                width: size.width * 0.4,
              ),
            ),
            Positioned(
              left: 0,
              top: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
                child: SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: size.height * 0.1,
                      ),
                      Text(
                        'Create Account,',
                        style: theme.textTheme.headline5.copyWith(
                          fontWeight: FontWeight.w100,
                          color: AppColors.primaryShade1,
                        ),
                      ),
                      Text(
                        'Sign up to get started!',
                        style: theme.textTheme.headline5.copyWith(
                          color: Colors.grey[500],
                          fontWeight: FontWeight.w100,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.05,
                      ),
                      Text(
                        'Are you a ..',
                        style: theme.textTheme.headline5.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      AnimationLimiter(
                        child: GridView.count(
                          crossAxisCount: 2,
                          crossAxisSpacing: 4,
                          mainAxisSpacing: 4,
                          padding: EdgeInsets.symmetric(vertical: 16),
                          shrinkWrap: true,
                          children: List.generate(
                            listUserTypes.length,
                            (index) => AnimationConfiguration.staggeredGrid(
                              position: index,
                              columnCount: 2,
                              duration: const Duration(milliseconds: 500),
                              child: ScaleAnimation(
                                child: FadeInAnimation(
                                  child: listUserTypes[index],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Already Have an Account ?',
                              style: theme.textTheme.bodyText2.copyWith(
                                color: AppColors.primaryShade1,
                              ),
                            ),
                            Text(
                              ' Log in',
                              style: theme.textTheme.bodyText2.copyWith(
                                color: AppColors.primaryShade1,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List<RegistrationTypeCard> listUserTypes = [
  RegistrationTypeCard(
    imgPath: 'asset/characters/doctor.png',
    userType: 'Doctor',
    function: () {},
  ),
  RegistrationTypeCard(
    imgPath: 'asset/characters/patient.png',
    userType: 'Patient',
    function: () {},
  ),
  RegistrationTypeCard(
    imgPath: 'asset/characters/scientist.png',
    userType: 'Laboratory',
    function: () {},
  ),
  RegistrationTypeCard(
    imgPath: 'asset/characters/shopkeeper.png',
    userType: 'Shopkeeper',
    function: () {},
  ),
];

class RegistrationTypeCard extends StatelessWidget {
  final String imgPath;
  final String userType;
  final Color backgroundColor;
  final Function function;

  const RegistrationTypeCard({
    Key key,
    @required this.imgPath,
    @required this.userType,
    this.backgroundColor = const Color(0xFFFFFFFF),
    @required this.function,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: function,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: 2,
        color: Colors.white,
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  imgPath,
                  //previous size was 0.2
                  height: size.width * 0.22,
                  width: size.width * 0.22,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                userType,
                style: theme.textTheme.headline6.copyWith(
                  fontWeight: FontWeight.w100,
                  color: AppColors.primaryShade1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
