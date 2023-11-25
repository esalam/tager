import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:tager/Tager/Presentation/animation_bg.dart';
import 'package:tager/Tager/Presentation/home_tager/presentation/home_screen/home_screen.dart';
import 'package:tager/Tager/Presentation/widgets/custom_head_screen.dart';
import 'package:tager/Tager/core/const/Styles.dart';
import 'package:tager/Tager/core/widget/Button.dart';

import '../../../../core/Navigation/navigation.dart';

class PayWithQrCodeScreen extends StatefulWidget {
  final String idNumber;
  const PayWithQrCodeScreen({super.key, required this.idNumber});

  @override
  State<PayWithQrCodeScreen> createState() => _PayWithQrCodeScreenState();
}

class _PayWithQrCodeScreenState extends State<PayWithQrCodeScreen> {
  late QrImage qrImage;
  @override
  void initState() {
    print(widget.idNumber);
    super.initState();
    final qrCode = QrCode(
      8,
      QrErrorCorrectLevel.H,
    )..addData(widget.idNumber);

    qrImage = QrImage(qrCode);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/img_constraction.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Stack(
              children: [
                const MyAnimatedBackground(
                    path1: "assets/images/img_inner_60_146x149.png",
                    path2: "assets/images/img_inner_60_155x156.png"),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    customHeadScreen(),
                    Text("please Payment with QR",
                        style: Styles.textStyleTitle20),
                    SizedBox(height: 5.h),
                    Text("please Scan QR code", style: Styles.textStyleTitle14),
                    SizedBox(height: 30.h),
                    SizedBox(
                      height: 200.h,
                      width: 200.h,
                      child: PrettyQrView(
                        qrImage: qrImage,
                        decoration: const PrettyQrDecoration(
                          shape: PrettyQrSmoothSymbol(
                            color: Color(0xffEEBB49),
                          ),
                        ),
                      ),
                    ),
                    Spacer(),
                    Button(
                      textButton: "Done",
                      funcation: () {
                        navigatofinsh(context, HomeScreen(), false);
                      },
                    ),
                    SizedBox(height: 25.h),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
