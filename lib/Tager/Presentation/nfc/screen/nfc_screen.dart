import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';
import 'package:nfc_manager/nfc_manager.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:tager/Tager/Presentation/animation_bg.dart';
import 'package:tager/Tager/Presentation/nfc/cubit/nfc_cubit.dart';
import 'package:tager/Tager/Presentation/nfc/cubit/nfc_state.dart';
import 'package:tager/Tager/Presentation/widgets/custom_head_screen.dart';
import '../../home_tager/presentation/home_screen/home_screen.dart';
import 'password.dart';
import 'package:tager/Tager/core/Navigation/navigation.dart';
import 'package:tager/Tager/core/const/Styles.dart';
import 'package:tager/Tager/core/widget/Button.dart';

class NfcScreen extends StatelessWidget {
  dynamic amount;
  NfcScreen({super.key, required this.amount});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => NfcCubit()..goToNfc(),
        child: BlocConsumer<NfcCubit, NfcState>(
            listener: (context, state) {},
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
                    'NFC Code',
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
                        SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: Column(
                            children: [
                              customHeadScreen(),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                'Please enter NFC Code ',
                                style: Styles.textStyleTitle18,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Lottie.asset("assets/images/nfc.json",
                                  height: 200.h),
                              SizedBox(
                                height: 35.h,
                              ),
                              Button(
                                textButton: 'Confirm',
                                funcation: () {
                                  BlocProvider.of<NfcCubit>(context).AddNfc(
                                      context: context,
                                      nfcCode: "546-5465-64654",
                                      amount: amount);
                                },
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }));
  }
}
