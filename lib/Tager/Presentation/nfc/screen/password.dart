import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:tager/Tager/Presentation/animation_bg.dart';
import 'package:tager/Tager/Presentation/nfc/cubit/nfc_state.dart';
import 'package:tager/Tager/Presentation/nfc/model/check_nfc_model.dart';
import 'package:tager/Tager/Presentation/nfc/model/nfc_model.dart';
import 'package:tager/Tager/Presentation/status/success_screen.dart';
import 'package:tager/Tager/core/const/Styles.dart';
import 'package:tager/Tager/core/widget/Button.dart';
import 'package:tager/Tager/core/widget/custom_text_form_field.dart';

import '../../../core/Navigation/navigation.dart';

import '../../home_tager/presentation/home_screen/home_screen.dart';
import '../cubit/nfc_cubit.dart';

class PasswordScreen extends StatelessWidget {
  final String amount;
  var keyForm = GlobalKey<FormState>();
  var passwordController = TextEditingController();

  PasswordScreen({super.key, required this.amount});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => NfcCubit()..goToNfc(),
        child: BlocConsumer<NfcCubit, NfcState>(
          listener: (context, state) {
            if (state is CheckNfcSuccessState) {
              // ignore: unrelated_type_equality_checks
            }
          },
          builder: (context, state) {
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
                  'MBAG',
                  style: Styles.textStyleTitle20,
                  gradientDirection: GradientDirection.ttb,
                  colors: [
                    Color(0xffEEBB49),
                    Colors.white.withOpacity(0.6),
                  ],
                ),
              ),
              body: Container(
                height: double.infinity,
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
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Stack(
                    children: [
                      const MyAnimatedBackground(
                          path1: "assets/images/img_inner_60_146x149.png",
                          path2: "assets/images/img_inner_60_155x156.png"),
                      Column(
                        children: [
                          Column(
                            children: [
                              // InkWell(
                              //   onTap: () {
                              //     print(nfcModel!.message);
                              //   },
                              //   child: Center(
                              //     child: GradientText(
                              //       'MBAG',
                              //       style: Styles.textStyleTitle50,
                              //       gradientDirection: GradientDirection.ttb,
                              //       colors: const [
                              //         Color(0xffEEBB49),
                              //         Color(0xffD9D9D9)
                              //       ],
                              //     ),
                              //   ),
                              // ),

                              GradientText(
                                'For trading',
                                style: Styles.textStyleTitle24,
                                colors: const [
                                  Color(0xffEEBB49),
                                  Color(0xffD9D9D9)
                                ],
                                gradientDirection: GradientDirection.ttb,
                                // gradientType: GradientType.linear,
                              ),
                              const SizedBox(
                                height: 10.0,
                              )
                            ],
                          ),
                          SizedBox(
                            height: 50.h,
                          ),
                          Text(
                            'Enter password',
                            style: Styles.textStyleTitle20,
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Form(
                            key: keyForm,
                            child: CustomTextFormField(
                                hintText: 'Enter password',
                                prefix: const Icon(Icons.password,
                                    color: Color(0xffC19843)),
                                textInputType: TextInputType.number,
                                controller: passwordController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return ' password Is Required';
                                  } else {
                                    return null;
                                  }
                                }),
                          ),
                          const Spacer(
                            flex: 1,
                          ),
                          Button(
                              textButton: 'Confirm',
                              funcation: () {
                                if (keyForm.currentState!.validate()) {
                                  BlocProvider.of<NfcCubit>(context).CheckNfc(
                                      password: passwordController.text,
                                      NfcCode: "65464-5464-4594",
                                      amount: amount);
                                  navigatofinsh(
                                      context, SuccessScreen(), false);
                                }
                              }),
                          SizedBox(
                            height: 50.h,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ));
  }
}
