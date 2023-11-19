import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../core/Navigation/navigation.dart';
import '../../../core/const/Styles.dart';
import '../../sign_in_tager/Sign_IN_Screen_tager/sign_in_screen_tager.dart';



class SplashScreenTager extends StatelessWidget {
  const SplashScreenTager({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed( Duration(seconds:5 ),(){
      navigatofinsh(context,  SignINScreenTager(), false);

    },);
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/img_constraction.png'),
              fit: BoxFit.cover,
            ),
          ),
          child:  Center(
            child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Animate(
                  effects: [FadeEffect(), ScaleEffect()],

                  child:  Text('MBAG',
                    style: Styles.textStyleTitle50.copyWith(color: const Color(
                        0xffBF953F
                    )),),
                ),

                Text('For trading',
                  style: Styles.textStyleTitle24.copyWith(color: const Color(
                      0xffBF953F
                  )),).animate().fade().scale(),
              ],
            )

          ),
        ),
      ),
    );
  }
}
