import 'package:dhct/Doctor/Navigation/bloc/DoctorNavigationBloc.dart';
import 'package:dhct/Values/Colors.dart';
import 'package:dhct/Widgets/CustomAppbar.dart';
import 'package:dhct/Widgets/CustomFAB.dart';
import 'package:flutter/cupertino.dart';
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
    Size size = MediaQuery.of(context).size;
    ThemeData theme = Theme.of(context);
    return Scaffold(
      backgroundColor: AppColors.activityBgShadeLight,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ListView(
              children: [
                SizedBox(
                  height: size.height * 0.15,
                ),
                BlogPostCard(
                  size: size,
                  theme: theme,
                  imgUrl: 'https://placeimg.com/640/480/arch',
                  blogTitle: 'This is a blog post title 1',
                ),
                BlogPostCard(
                  size: size,
                  theme: theme,
                  imgUrl: 'https://placeimg.com/640/480/nature',
                  blogTitle: 'This is a blog post title 2',
                ),
                BlogPostCard(
                  size: size,
                  theme: theme,
                  imgUrl: 'https://placeimg.com/640/480/tech',
                  blogTitle: 'This is a blog post title 3',
                ),
              ],
            ),
          ),
          CustomAppbar(
              size: size,
              appBarColor: AppColors.appBarColorDark,
              appBarLeadingIconColor: AppColors.appBarDarkIconColor,
              appBarTextColor: AppColors.appBarDarkTextColor,
              appBarTitle: 'My Blogs',
              hasLeadingIcon: true,
              leadingIcon: Icons.menu_rounded,
              leadingIconFunction: widget.onDoctorNavMenuIconTap),
        ],
      ),
      floatingActionButton: CustomFAB(
        buttonText: 'Add Blog',
        buttonFunction: () {},
        buttonTextColor: AppColors.primaryShade1,
        hasIcon: true,
        buttonIcon: Icons.add,
        iconColor: AppColors.primaryShade1,
      ),
    );
  }
}

class BlogPostCard extends StatelessWidget {
  final Size size;
  final ThemeData theme;
  final String blogTitle;
  final String imgUrl;

  const BlogPostCard({
    Key key,
    @required this.size,
    @required this.theme,
    @required this.blogTitle,
    @required this.imgUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      margin: EdgeInsets.symmetric(vertical: 6),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.cardLightColor,
        borderRadius: BorderRadius.circular(29),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
//            'Blog Post Title 1',
            blogTitle,
            style: theme.textTheme.headline6,
          ),
          SizedBox(
            height: 16,
          ),
          ClipRRect(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(29),
              bottomLeft: Radius.circular(29),
              bottomRight: Radius.circular(8),
              topLeft: Radius.circular(8),
            ),
            child: Image.network(
              imgUrl,
              height: size.width * 0.4,
              width: size.width,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
