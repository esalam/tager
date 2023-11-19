import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../../../core/const/Styles.dart';
import '../../../core/widget/Button.dart';
import '../../../core/widget/custom_text_form_field.dart';
class Password extends StatelessWidget {
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Color(0xffBF953F),
                  Colors.black,
                  Colors.black,
                  Colors.black
                ],
                begin: AlignmentDirectional.topStart,
                end: AlignmentDirectional.centerStart

            ),
            image: DecorationImage(
              image: AssetImage('assets/images/img_constraction.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                Column(
                  children: [
                    const SizedBox(height: 10.0,),
                    Center(
                      child: GradientText('MBAG',

                        style: Styles.textStyleTitle50

                        ,

                        gradientDirection:GradientDirection.ttb,
                        colors: const [
                          Color(0xffEEBB49),
                          Color(0xffD9D9D9)

                        ],


                      ),
                    ),

                    SizedBox(height: 8.h),
                    GradientText('For trading',
                      style: Styles.textStyleTitle24,
                      colors: const [
                        Color(0xffEEBB49),
                        Color(0xffD9D9D9)

                      ],
                      gradientDirection:GradientDirection.ttb,
                      // gradientType: GradientType.linear,
                    ),
                    const SizedBox(
                      height: 10.0,
                    )
                  ],
                ),

                SizedBox(height: 50.h,),


                Text('Enter password',style: Styles.textStyleTitle20,),
                SizedBox(height: 20.h,),
                CustomTextFormField(hintText: 'Enter password',
                    prefix: const Icon(Icons.password, color: Color(0xffC19843)),
                    textInputType: TextInputType.number,
                    controller: passwordController,
                    validator
                        :(value) {
                      if (value!.isEmpty) {
                        return ' password Is Required';
                      } else {
                        return null;
                      }
                    }

                ),
                const Spacer(flex: 1,),

                    Button(textButton:'Next',funcation: (){}),

                SizedBox(height: 50.h,),


              ],

            ),
          ),
        ),
      ),
    );
  }
}
