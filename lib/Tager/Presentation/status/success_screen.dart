import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import 'package:tager/Tager/Presentation/animation_bg.dart';
import 'package:tager/Tager/Presentation/home_tager/presentation/home_screen/home_screen.dart';
import 'package:tager/Tager/Presentation/widgets/custom_head_screen.dart';
import 'package:tager/Tager/core/Navigation/navigation.dart';
import 'package:tager/Tager/core/const/Styles.dart';
import 'package:tager/Tager/core/widget/Button.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
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
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(height: 20.h),
                  customHeadScreen(),
                  SizedBox(height: 50.h),
                  Container(
                    margin: EdgeInsets.all(10.h),
                    padding: EdgeInsets.all(50.h),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(10.h),
                    ),
                    child: Column(
                      children: [
                        Lottie.asset("assets/images/success.json",
                            height: 100.h),
                        Text(
                          "Success",
                          style: Styles.textStyleTitle24,
                        ),
                        Text("Your money add successfully"),
                        SizedBox(height: 20.h,),
                        Button(
                          textButton: "Back To Home",
                          funcation: () {
                            navigatofinsh(context, HomeScreen(), false);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
