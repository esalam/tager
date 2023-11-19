import 'package:barcode_widget/barcode_widget.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:tager/Tager/Presentation/animation_bg.dart';
import 'package:tager/Tager/Presentation/widgets/custom_head_screen.dart';
import 'package:tager/Tager/core/Navigation/navigation.dart';

import '../../../core/const/Styles.dart';
import '../../../core/widget/Button.dart';
import '../../home_tager/presentation/home_screen/home_screen.dart';
import '../../nfc/screen/password.dart';
import '../cubit/qr_cubit.dart';
import '../cubit/qr_state_cubit.dart';

class QrScreen extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  var amount;
  QrScreen({super.key, required this.amount});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QrCubit()..getQr(amount: amount),
      child: BlocConsumer<QrCubit, QrCubitState>(
        listener: (context, state) {},
        builder: (context, state) {
          return ConditionalBuilder(
            condition: BlocProvider.of<QrCubit>(context).qrModel != null,
            builder: (context) => Scaffold(
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
                  style: Styles.textStyleTitle50,
                  gradientDirection: GradientDirection.ttb,
                  colors: [
                    Color(0xffEEBB49),
                    Colors.white.withOpacity(0.6),
                  ],
                ),
              ),
              body: Container(
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
                          customHeadScreen(),
                          Text(
                            'Please Scane your card',
                            style: Styles.textStyleTitle18,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          SizedBox(
                              width: 150.w,
                              height: 150.h,
                              child: BarcodeWidget(
                                data:
                                    '${BlocProvider.of<QrCubit>(context).qrModel!.QR}',
                                barcode: Barcode.qrCode(),
                                color: Color(0xffEEBB49),
                                height: 100,
                                width: 100,
                              )),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .10,
                          ),
                          Button(
                            textButton: 'Back To Home',
                            funcation: () {
                              navigatofinsh(context, HomeScreen(), false);
                            },
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            fallback: (context) => Center(child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }
}
