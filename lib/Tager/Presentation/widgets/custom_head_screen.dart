import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:tager/Tager/core/const/Styles.dart';

Widget customHeadScreen() => Column(
      children: [
        SizedBox(height: 20.h),
        Center(
          child: GradientText(
            'MBAG',
            style: Styles.textStyleTitle50,
            gradientDirection: GradientDirection.ttb,
            gradientType: GradientType.values[0],
            colors: const [
              Color(0xffEEBB49),
              Color(0xffEEBB49),
              Color(0xffD9D9D9)
            ],
          ),
        ),
        SizedBox(height: 8.h),
        Center(
          child: GradientText(
            'For trading',
            style: Styles.textStyleTitle24,
            colors: const [
              Color(0xffEEBB49),
              Color(0xffEEBB49),
              Color(0xffD9D9D9),
              Color(0xffD9D9D9)
            ],
            gradientDirection: GradientDirection.ttb,
          ),
        ),
        SizedBox(height: 40.h),
      ],
    );
