import 'package:dhct/Values/Colors.dart';
import 'package:dhct/Widgets/CustomAppbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PatientDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ThemeData theme = Theme.of(context);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: AppColors.primaryShade1));
    return SafeArea(
      child: Scaffold(
//        backgroundColor: AppColors.activityBgShadeLight,
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage('https://picsum.photos/700/700?grayscale.jpg'),
                ),
              ),
              height: size.height * 0.4,
            ),
            Column(
              children: [
                Container(
                  height: size.height * 0.35,
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
                  height: 150,
//                  height: size.height * 0.65,
                  decoration: BoxDecoration(
                    color: AppColors.activityBgShadeLight,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(65),
                    ),
                  ),
                  child: ListView(
                    shrinkWrap: true,
                    padding: EdgeInsets.symmetric(vertical: 16),
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        child: ,
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

//SingleChildScrollView(
//child: Stack(
//children: [
//Stack(
//children: [
//Image.network(
//'https://picsum.photos/700/700?grayscale.jpg',
//fit: BoxFit.cover,
//height: size.width * 0.75,
//width: size.width,
//),
//Column(
//children: [
//IconButton(
//onPressed: null,
//icon: Icon(
//Icons.arrow_back_rounded,
//color: Colors.white,
//),
//),
//],
//),
//],
//),
//Container(
//margin: EdgeInsets.only(top: size.width * 0.58),
//width: size.width,
////                height: 150,
//decoration: BoxDecoration(
//color: AppColors.activityBgShadeLight,
////                  color: Colors.yellowAccent,
//borderRadius: BorderRadius.only(
//topRight: Radius.circular(75),
//),
//),
//padding: EdgeInsets.only(
//left: 16,
//right: 16,
//),
//child: Column(
//children: [
//Row(
//crossAxisAlignment: CrossAxisAlignment.center,
//mainAxisAlignment: MainAxisAlignment.spaceBetween,
//children: [
//Column(
//mainAxisAlignment: MainAxisAlignment.center,
//crossAxisAlignment: CrossAxisAlignment.start,
//children: [
//Text(
//'Keval Makadiya',
//style: theme.textTheme.headline5,
//),
//Text(
//'Surat, Gujarat',
//style: theme.textTheme.bodyText2.copyWith(
//color: Colors.grey,
//),
//),
//Text(
//'21 Years',
//style: theme.textTheme.bodyText2.copyWith(
//color: Colors.grey,
//),
//),
//],
//),
//FloatingActionButton.extended(
//onPressed: null,
//label: Text('CALL'),
//icon: Icon(
//CupertinoIcons.phone,
//color: Colors.white,
//),
//backgroundColor: AppColors.primaryShade2,
//shape: RoundedRectangleBorder(
//borderRadius: BorderRadius.only(
//topLeft: Radius.circular(5),
//bottomRight: Radius.circular(5),
//topRight: Radius.circular(25),
//bottomLeft: Radius.circular(25),
//),
//),
//),
//],
//),
//],
//),
//),
//],
//),
//),
