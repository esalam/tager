import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:tager/Tager/Presentation/animation_bg.dart';
import 'package:tager/Tager/Presentation/widgets/custom_head_screen.dart';

import '../../../core/Navigation/navigation.dart';
import '../../../core/const/Styles.dart';
import '../../../core/const/chachHelper.dart';

import '../../../core/const/consts.dart';
import '../../../core/widget/Button.dart';
import '../../../core/widget/custom_text_form_field.dart';
import '../../home_tager/presentation/home_screen/home_screen.dart';
import '../cubit/login_view_cubit.dart';
import '../cubit/login_view_state.dart';

class SignINScreenTager extends StatelessWidget {
  var emailController = TextEditingController();
  var keyForm = GlobalKey<FormState>();
  var passwordController = TextEditingController();

  SignINScreenTager({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => LoginViewCubit(),
        child: BlocConsumer<LoginViewCubit, LoginViewState>(
          listener: (context, state) {
            if (state is LoginViewStateSuccess) {
              if (state.userLoginModel.status == true) {
              } else {
                Fluttertoast.showToast(
                    msg: '${state.userLoginModel.message}',
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0);
              }
            }
          },
          builder: (context, state) {
            
            return Scaffold(
                resizeToAvoidBottomInset: false,
                body: SafeArea(
                  child: Animate(
                    effects: const [FadeEffect(), ScaleEffect()],
                    child: Stack(
                      children: [
                        const MyAnimatedBackground(
                            path1: "assets/images/img_inner_60_146x149.png",
                            path2: "assets/images/img_inner_60_155x156.png"),
                        Container(
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                  'assets/images/img_constraction.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Form(
                              key: keyForm,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  customHeadScreen(),
                                  Text(
                                    'Email',
                                    style: Styles.textStyleTitle14,
                                  ),
                                  SizedBox(height: 10.h),
                                  CustomTextFormField(
                                      hintText: 'ali@gmail.com',
                                      prefix: const Icon(Icons.email,
                                          color: Color(0xffC19843)),
                                      textInputType: TextInputType.emailAddress,
                                      controller: emailController,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'email is  empty';
                                        } else {
                                          return null;
                                        }
                                      }),
                                  SizedBox(height: 15.h),
                                  Text(
                                    'password',
                                    style: Styles.textStyleTitle14,
                                  ),
                                  SizedBox(height: 10.h),
                                  TextFormField(
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Password is to short';
                                      } else {
                                        return null;
                                      }
                                    },
                                    keyboardType: TextInputType.emailAddress,
                                    controller: passwordController,
                                    decoration: InputDecoration(
                                      hintText: "********",
                                      focusColor: const Color(0Xff2056AE),
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                        borderSide: const BorderSide(
                                          color: Color(0xffEEBB49),
                                          width: 2.0,
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                        borderSide: const BorderSide(
                                          color: Color(0xffC19843),
                                          width: 2.0,
                                        ),
                                      ),
                                      suffixIcon: IconButton(
                                        onPressed: () {
                                          BlocProvider.of<LoginViewCubit>(
                                                  context)
                                              .changIconPassword();
                                        },
                                        icon: Icon(
                                            BlocProvider.of<LoginViewCubit>(
                                                    context)
                                                .subfix,
                                            color: const Color(0xffEEBB49),
                                            size: 30.0),
                                      ),
                                      prefixIcon: const Icon(Icons.lock_outline,
                                          color: Color(0xffEEBB49), size: 30.0),
                                    ),
                                    obscureText:
                                        BlocProvider.of<LoginViewCubit>(context)
                                            .isPassword,
                                  ),
                                  const SizedBox(height: 50),
                                  ConditionalBuilder(
                                    condition:
                                        (state is! LoginViewStateLoading),
                                    builder: (context) => Button(
                                      textButton: 'Sign In',
                                      funcation: () {
                                        if (keyForm.currentState!.validate()) {
                                          BlocProvider.of<LoginViewCubit>(
                                                  context)
                                              .userLogin(
                                                  email: emailController.text,
                                                  password:
                                                      passwordController.text,
                                                  context: context);
                                        }
                                      },
                                    ),
                                    fallback: (context) => const Center(
                                        child: CircularProgressIndicator(
                                      color: Color(0xffEEBB49),
                                    )),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ));
          },
        ));
  }
}
