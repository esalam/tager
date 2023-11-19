import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:tager/Tager/Presentation/animation_bg.dart';
import 'package:tager/Tager/Presentation/home_tager/presentation/home_screen/home_screen.dart';
import 'package:tager/Tager/Presentation/profile/screen/edit_profile_scree.dart';
import 'package:tager/Tager/core/Navigation/navigation.dart';
import 'package:tager/Tager/core/const/Styles.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffBF953F).withOpacity(0.9),
        leading: IconButton(
          onPressed: () {
            navigatofinsh(context, HomeScreen(), false);
          },
          icon: Icon(Icons.home, size: 30),
        ),
        elevation: 0.0,
        centerTitle: true,
        title: GradientText(
          'Settings',
          style: Styles.textStyleTitle20,
          gradientDirection: GradientDirection.ttb,
          colors: [
            Color(0xffEEBB49),
            Colors.white.withOpacity(0.6),
          ],
        ),
      ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [
                Color(0xffBF953F),
                Colors.black,
                Colors.black,
                Colors.black
              ],
              begin: AlignmentDirectional.topStart,
              end: AlignmentDirectional.centerStart),
          image: DecorationImage(
            image: AssetImage('assets/images/img_constraction.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            const MyAnimatedBackground(
                path1: "assets/images/img_inner_60_146x149.png",
                path2: "assets/images/img_inner_60_155x156.png"),
            Column(
              children: [
                Icon(
                  Icons.account_circle_outlined,
                  size: 150.h,
                  color: Color(0xffBF953F),
                ),
                Text(
                  'Settings',
                  style: Styles.textStyleTitle24,
                ),
                Container(
                  margin: EdgeInsets.all(10.h),
                  padding: EdgeInsets.all(10.h),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10.h),
                  ),
                  child: Column(
                    children: [
                      _rowProfile(title: 'Language', press: () {}),
                      const Divider(color: Color(0xffBF953F)),
                      _rowProfile(
                          title: 'Account Information',
                          press: () {
                            navigato(context, const EditProfileScreen());
                          }),
                      const Divider(color: Color(0xffBF953F)),
                      _rowProfile(title: 'Light mood', press: () {}),
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

  Widget _rowProfile({required String title, required VoidCallback press}) {
    return GestureDetector(
      onTap: press,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        child: Row(
          children: [
            Text(
              title,
              style: Styles.textStyleTitle20,
            ),
            const Spacer(),
            Icon(
              Icons.arrow_forward_ios,
              size: 15.h,
              color: Color(0xffBF953F),
            ),
          ],
        ),
      ),
    );
  }
}
