import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:tager/Tager/Presentation/animation_bg.dart';
import 'package:tager/Tager/Presentation/home_tager/presentation/cubit/user_data_cubit.dart';
import 'package:tager/Tager/Presentation/home_tager/presentation/cubit/user_data_state.dart';
import 'package:tager/Tager/Presentation/home_tager/presentation/home_screen/home_screen.dart';
import 'package:tager/Tager/core/Navigation/navigation.dart';
import 'package:tager/Tager/core/const/Styles.dart';
import 'package:tager/Tager/core/const/dioHelper.dart';
import 'package:tager/Tager/core/widget/Button.dart';
import 'package:tager/Tager/core/widget/custom_text_form_field.dart';

class ConfirmPhoneScreen extends StatelessWidget {
  final String code;
  final String phone;
  ConfirmPhoneScreen({super.key, required this.code, required this.phone});
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    print(code);
    print(phone);
    return BlocProvider(
      create: (context) => userDataCubit(),
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
          if (state is UpdateUserDataError) {
            Fluttertoast.showToast(
                msg: "Please Try Again",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
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
                'Confirm Phone',
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
                                child: Form(
                                  key: formKey,
                                  child: Column(
                                    children: [
                                      Container(
                                        alignment: Alignment.center,
                                        child: Text(
                                          'Please Enter Verification Code',
                                          style: Styles.textStyleTitle14,
                                        ),
                                      ),
                                      SizedBox(height: 10.h),
                                      CustomTextFormField(
                                        hintText: "Enter Verification Code",
                                        prefix: const Icon(Icons.numbers,
                                            color: Color(0xffC19843)),
                                        textInputType:
                                            TextInputType.emailAddress,
                                        controller: emailController,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'code is empty';
                                          } else {
                                            return null;
                                          }
                                        },
                                      ),
                                      SizedBox(height: 30.h),
                                      state is UpdateUserDataLoading
                                          ? const Center(
                                              child: CircularProgressIndicator(
                                              color: Color(0xffEEBB49),
                                            ))
                                          : Button(
                                              textButton: 'Confirm Code',
                                              funcation: () {
                                                if (formKey.currentState!
                                                    .validate()) {
                                                  cubit.confirmPhone(
                                                      phone: phone,
                                                      code: code,
                                                      context: context);
                                                }
                                              },
                                            ),
                                    ],
                                  ),
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
}
