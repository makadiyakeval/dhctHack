import 'package:dhct/LoginRegisteration/RegistrationPage.dart';
import 'package:dhct/Values/Colors.dart';
import 'package:dhct/Widgets/CustomTextInput.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

const double screenPadding = 16;

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _value = 'Doctor';
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
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
                'asset/images/main_top.png',
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
                  child: AnimationLimiter(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: AnimationConfiguration.toStaggeredList(
                        duration: const Duration(milliseconds: 375),
                        childAnimationBuilder: (widget) => SlideAnimation(
                          verticalOffset: -25,
                          child: FadeInAnimation(
                            child: widget,
                          ),
                        ),
                        children: [
                          SizedBox(
                            height: size.height * 0.1,
                          ),
                          Text(
                            'Welcome Back!',
                            style: theme.textTheme.headline5.copyWith(
                              fontWeight: FontWeight.w100,
                              color: AppColors.primaryShade1,
                            ),
                          ),
                          Text(
                            'Login to Continue.',
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
                            'Are You ?',
                            style: theme.textTheme.subtitle1.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Container(
                            width: size.width,
                            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                            decoration: BoxDecoration(
                              color: AppColors.textInputBackground,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: DropdownButtonFormField<String>(
                              hint: Text(
                                'Who Are You?',
                                style: theme.textTheme.bodyText1.copyWith(
                                  color: AppColors.textInputHintColor,
                                ),
                              ),
                              value: _value,
                              decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: AppColors.textInputBackground),
                                ),
                              ),
                              dropdownColor: AppColors.textInputBackground,
                              items: [
                                DropdownMenuItem<String>(
                                  child: Row(
                                    children: [
                                      Text('👨‍⚕️'),
                                      SizedBox(width: 12),
                                      Text(
                                        'Doctor',
                                        style: theme.textTheme.bodyText1.copyWith(
                                          color: AppColors.textInputTextColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                  value: 'Doctor',
                                ),
                                DropdownMenuItem<String>(
                                  child: Row(
                                    children: [
                                      Text('🔬'),
                                      SizedBox(width: 12),
                                      Text(
                                        'Laboratory',
                                        style: theme.textTheme.bodyText1.copyWith(
                                          color: AppColors.textInputTextColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                  value: 'Laboratory',
                                ),
                                DropdownMenuItem<String>(
                                  child: Row(
                                    children: [
                                      Text('🧑'),
                                      SizedBox(width: 12),
                                      Text(
                                        'Patient',
                                        style: theme.textTheme.bodyText1.copyWith(
                                          color: AppColors.textInputTextColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                  value: 'Patient',
                                ),
                                DropdownMenuItem<String>(
                                  child: Row(
                                    children: [
                                      Text('🏬'),
                                      SizedBox(width: 12),
                                      Text(
                                        'ShopKeeper',
                                        style: theme.textTheme.bodyText1.copyWith(
                                          color: AppColors.textInputTextColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                  value: 'ShopKeeper',
                                ),
                              ].toList(),
                              onChanged: (newValue) {
                                setState(() {
                                  _value = newValue;
                                  print('Drop Value: ' + _value);
                                });
                              },
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.03,
                          ),
                          Text(
                            'Email',
                            style: theme.textTheme.subtitle1.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          CustomTextInput(
                            hintText: 'Enter Your Email',
                            leadingIcon: FeatherIcons.mail,
                            hasLeadingIcon: true,
                          ),
                          SizedBox(
                            height: size.height * 0.03,
                          ),
                          Text(
                            'Password',
                            style: theme.textTheme.subtitle1.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          CustomTextInput(
                            hintText: 'Enter Password',
                            leadingIcon: FeatherIcons.key,
                            trailingIcon: FeatherIcons.eye,
                            hasTrailingIcon: true,
                            hasLeadingIcon: true,
                            isPasswordField: true,
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'Forget Password ?',
                                style: theme.textTheme.bodyText2.copyWith(
                                  color: AppColors.primaryShade3,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: size.height * 0.03,
                          ),
                          Center(
                            child: Container(
                              width: size.width * 0.7,
                              child: FlatButton(
                                color: AppColors.primaryShade2,
                                textColor: AppColors.secondaryShade1,
                                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(29),
                                ),
                                child: Center(
                                  child: Text('Log In'),
                                ),
                                onPressed: () {},
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.03,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterationPage()));
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Don\'t Have an Account ?',
                                  style: theme.textTheme.bodyText2.copyWith(
                                    color: AppColors.primaryShade1,
                                  ),
                                ),
                                Text(
                                  ' Register',
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
