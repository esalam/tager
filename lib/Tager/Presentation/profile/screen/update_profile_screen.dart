import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:tager/Tager/Presentation/animation_bg.dart';
import 'package:tager/Tager/Presentation/home_tager/presentation/cubit/user_data_cubit.dart';
import 'package:tager/Tager/Presentation/home_tager/presentation/cubit/user_data_state.dart';
import 'package:tager/Tager/Presentation/home_tager/presentation/home_screen/home_screen.dart';
import 'package:tager/Tager/Presentation/profile/screen/update_email_screen.dart';
import 'package:tager/Tager/Presentation/profile/screen/update_phone_screen.dart';

import 'package:tager/Tager/core/Navigation/navigation.dart';
import 'package:tager/Tager/core/const/Styles.dart';
import 'package:tager/Tager/core/widget/Button.dart';
import 'package:tager/Tager/core/widget/custom_text_form_field.dart';

class UpdateProfileScreen extends StatelessWidget {
  UpdateProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => userDataCubit()..getUserData(),
      child: BlocConsumer<userDataCubit, UserDataState>(
        listener: (context, state) {
          if (state is UpdateUserDataSuccess) {
            Fluttertoast.showToast(
                msg: state.message,
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.blue,
                textColor: Colors.white,
                fontSize: 16.0);
          }
        },
        builder: (context, state) {
          var cubit = BlocProvider.of<userDataCubit>(context);
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
                'Update Profile',
                style: Styles.textStyleTitle20,
                gradientDirection: GradientDirection.ttb,
                colors: [
                  Color(0xffEEBB49),
                  Colors.white.withOpacity(0.6),
                ],
              ),
            ),
            body: state is UserDataLoadingState
                ? const Center(child: CircularProgressIndicator())
                : Container(
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
                              Icon(
                                Icons.account_circle_outlined,
                                size: 150.h,
                                color: Color(0xffBF953F),
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
                                    Container(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        'Email',
                                        style: Styles.textStyleTitle14,
                                      ),
                                    ),
                                    SizedBox(height: 10.h),
                                    GestureDetector(
                                      onTap: () {
                                        navigato(context, UpdateEmailScreen());
                                      },
                                      child: CustomTextFormField(
                                          enable: false,
                                          hintText: cubit
                                              .userDataModel!.trader!.email,
                                          prefix: const Icon(Icons.email,
                                              color: Color(0xffC19843)),
                                          textInputType:
                                              TextInputType.emailAddress,
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return 'email is  empty';
                                            } else {
                                              return null;
                                            }
                                          }),
                                    ),
                                    SizedBox(height: 15.h),
                                    const Divider(color: Color(0xffBF953F)),
                                    Container(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        'Phone',
                                        style: Styles.textStyleTitle14,
                                      ),
                                    ),
                                    SizedBox(height: 10.h),
                                    GestureDetector(
                                      onTap: () {
                                        navigato(context, UpdatePhoneScreen());
                                      },
                                      child: CustomTextFormField(
                                          enable: false,
                                          hintText: cubit
                                              .userDataModel!.trader!.phone,
                                          prefix: const Icon(Icons.phone,
                                              color: Color(0xffC19843)),
                                          textInputType: TextInputType.phone,
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return 'phone is  empty';
                                            } else {
                                              return null;
                                            }
                                          }),
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
        },
      ),
    );
  }

  Widget _rowEditProfile({
    required String title,
    required String hintText,
    required String initData,
    required TextEditingController controller,
    required String error,
    required IconData icon,
    required TextInputType textInputType,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: CustomTextFormField(
          initValue: initData,
          hintText: hintText,
          prefix: Icon(icon, color: Color(0xffC19843)),
          textInputType: TextInputType.emailAddress,
          controller: controller,
          validator: (value) {
            if (value!.isEmpty) {
              return error;
            } else {
              return null;
            }
          }),
    );
  }
}
