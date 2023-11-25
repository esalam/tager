import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:tager/Tager/Presentation/animation_bg.dart';
import 'package:tager/Tager/Presentation/home_tager/presentation/cubit/user_data_cubit.dart';
import 'package:tager/Tager/Presentation/home_tager/presentation/cubit/user_data_state.dart';
import 'package:tager/Tager/Presentation/home_tager/presentation/home_screen/home_screen.dart';
import 'package:tager/Tager/Presentation/last_transaction/scrren/last_transaction_screen.dart';
import 'package:tager/Tager/Presentation/profile/screen/update_profile_screen.dart';
import 'package:tager/Tager/core/Navigation/navigation.dart';
import 'package:tager/Tager/core/const/Styles.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => userDataCubit()..getUserData(),
      child: BlocConsumer<userDataCubit, UserDataState>(
        listener: (context, state) {},
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
                'Profile',
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
                        Column(
                          children: [
                            Icon(
                              Icons.account_circle_outlined,
                              size: 150.h,
                              color: Color(0xffBF953F),
                            ),
                            GestureDetector(
                              onTap: () {
                                navigato(context, UpdateProfileScreen());
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 10.h, horizontal: 25.h),
                                margin: EdgeInsets.all(10.h),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.h),
                                    border: Border.all(
                                      color: const Color(0xffEEBB49),
                                    )),
                                child: Text(
                                  "Edit Profile",
                                  style: Styles.textStyleTitle16,
                                ),
                              ),
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
                                  _rowEditProfile(
                                      title: "Name",
                                      desc:
                                          "${cubit.userDataModel!.trader!.firstName} ${cubit.userDataModel!.trader!.lastName}"),
                                  const Divider(color: Color(0xffBF953F)),
                                  _rowEditProfile(
                                      title: "Address",
                                      desc: cubit
                                          .userDataModel!.trader!.countryName!),
                                  const Divider(color: Color(0xffBF953F)),
                                  _rowEditProfile(
                                      title: "Phone number",
                                      desc:
                                          cubit.userDataModel!.trader!.phone!),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
          );
        },
      ),
    );
  }

  Widget _rowEditProfile({required String title, required String desc}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Row(
        children: [
          Text(
            "$title : ",
            style: Styles.textStyleTitle20,
          ),
          Text(
            desc,
            style: Styles.textStyleTitle14,
          ),
        ],
      ),
    );
  }

}
