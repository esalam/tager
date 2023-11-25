import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:tager/Tager/Presentation/animation_bg.dart';
import 'package:tager/Tager/Presentation/home_tager/presentation/home_screen/pay_with_qrcode.dart';
import 'package:tager/Tager/Presentation/profile/screen/edit_profile_scree.dart';
import 'package:tager/Tager/Presentation/sign_in_tager/Sign_IN_Screen_tager/sign_in_screen_tager.dart';
import 'package:tager/Tager/Presentation/widgets/custom_head_screen.dart';

import '../../../../core/Navigation/navigation.dart';
import '../../../../core/const/Styles.dart';
import '../../../../core/widget/Button.dart';
import '../../../last_transaction/scrren/last_transaction_screen.dart';
import '../../../profile/screen/profile_screen.dart';
import '../../../verify/screen/verify_screen.dart';
import '../cubit/user_data_cubit.dart';
import '../cubit/user_data_state.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => userDataCubit()..getUserData(),
      child: BlocConsumer<userDataCubit, UserDataState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
              appBar: AppBar(
                backgroundColor: Color(0xffBF953F).withOpacity(0.9),
                elevation: 0.0,
                centerTitle: true,
                excludeHeaderSemantics: true,
                title: GradientText(
                  'Home',
                  style: Styles.textStyleTitle20,
                  gradientDirection: GradientDirection.ttb,
                  colors: [
                    Color(0xffEEBB49),
                    Colors.white.withOpacity(0.6),
                  ],
                ),
                actions: [
                  BlocProvider.of<userDataCubit>(context).userDataModel != null
                      ? Padding(
                          padding: EdgeInsets.all(10.h),
                          child: Badge(
                            label: Text(
                              BlocProvider.of<userDataCubit>(context)
                                  .userDataModel!
                                  .countNotifications
                                  .toString(),
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            child: Icon(Icons.notifications),
                          ),
                        )
                      : SizedBox.shrink(),
                ],
              ),
              drawer: Drawer(
                width: MediaQuery.of(context).size.width * .7,
                backgroundColor: Colors.black,
                surfaceTintColor: Colors.purple,
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Color(0xffEEBB49), width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 40.h,
                    ),
                    ListTile(
                      title: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Color(0xffEEBB49),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child:
                                Icon(Icons.home, color: Colors.black, size: 30),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            'Home',
                            style: Styles.textStyleTitle20,
                          ),
                        ],
                      ),
                      onTap: () {
                        navigatofinsh(context, HomeScreen(), false);
                      },
                    ),
                    ListTile(
                      title: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Color(0xffEEBB49),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Icon(Icons.access_time,
                                color: Colors.black, size: 30),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Transaction ',
                            style: Styles.textStyleTitle20,
                          ),
                        ],
                      ),
                      onTap: () {
                        navigato(context, LastTransaction());
                      },
                    ),
                    ListTile(
                      title: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Color(0xffEEBB49),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Icon(Icons.account_box_rounded,
                                color: Colors.black, size: 30),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            'Account',
                            style: Styles.textStyleTitle20,
                          ),
                        ],
                      ),
                      onTap: () {
                        navigato(context, EditProfileScreen());
                      },
                    ),
                    Spacer(),
                    ListTile(
                      title: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Color(0xffEEBB49),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Icon(Icons.logout,
                                color: Colors.black, size: 30),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            'LogOut',
                            style: Styles.textStyleTitle20,
                          ),
                        ],
                      ),
                      onTap: () {
                        navigatofinsh(context, SignINScreenTager(), false);
                      },
                    ),
                    SizedBox(height: 30.h),
                  ],
                ),
              ),
              body: RefreshIndicator(
                onRefresh: ()=>BlocProvider.of<userDataCubit>(context).getUserData(),
                child: ConditionalBuilder(
                  condition:
                      BlocProvider.of<userDataCubit>(context).userDataModel !=
                          null,
                  builder: (context) => Container(
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
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Stack(
                        children: [
                          const MyAnimatedBackground(
                              path1: "assets/images/img_inner_60_146x149.png",
                              path2: "assets/images/img_inner_60_155x156.png"),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  customHeadScreen(),
                                  const SizedBox(
                                    height: 10.0,
                                  )
                                ],
                              ),
                              Container(
                                color: Color.fromRGBO(179, 169, 169, 0.6),
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            'Name',
                                            style: Styles.textStyleTitle16,
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Text(
                                            '${BlocProvider.of<userDataCubit>(context).userDataModel!.trader!.firstName} ${BlocProvider.of<userDataCubit>(context).userDataModel!.trader!.lastName}',
                                            style: Styles.textStyleTitle16
                                                .copyWith(
                                                    color: Color(0xffFCF6BA)),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 18),
                                      Row(
                                        children: [
                                          Text(
                                            'Balance',
                                            style: Styles.textStyleTitle16,
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Text(
                                            '${BlocProvider.of<userDataCubit>(context).userDataModel!.trader!.balance}',
                                            style: Styles.textStyleTitle16
                                                .copyWith(
                                                    color: Color(0xffFCF6BA)),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 18),
                                      Row(
                                        children: [
                                          Text(
                                            'MBAG NO',
                                            style: Styles.textStyleTitle16,
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Text(
                                            '${BlocProvider.of<userDataCubit>(context).userDataModel!.trader!.iD}',
                                            style: Styles.textStyleTitle16
                                                .copyWith(
                                                    color: Color(0xffFCF6BA)),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Today sales',
                                      style: Styles.textStyleTitle24
                                          .copyWith(color: Color(0xffEEBB49)),
                                    ),
                                    Text(
                                      '${BlocProvider.of<userDataCubit>(context).userDataModel!.trader!.todaySales} ',
                                      style: Styles.textStyleTitle20,
                                    ),
                                  ],
                                ),
                              ),
                              _buildTransactionFrame(
                                icon: Icons.access_time_filled,
                                title: "Transaction",
                                press: () {
                                  navigato(context, LastTransaction());
                                },
                              ),
                              _buildTransactionFrame(
                                icon: Icons.access_time_filled,
                                title: "Profile",
                                press: () {
                                  navigato(context, EditProfileScreen());
                                },
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Button(
                                  textButton: 'pay',
                                  funcation: () {
                                    navigato(
                                        context,
                                        PayWithQrCodeScreen(
                                            idNumber:
                                                BlocProvider.of<userDataCubit>(
                                                        context)
                                                    .userDataModel!
                                                    .trader!
                                                    .iD!));
                                  },
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  fallback: (context) => Center(
                      child: CircularProgressIndicator(
                    color: Color(0xffEEBB49),
                  )),
                ),
              ));
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildTransactionFrame({
    required IconData icon,
    required String title,
    required VoidCallback press,
  }) {
    return GestureDetector(
      onTap: press,
      child: Container(
        padding: EdgeInsets.all(10.h),
        margin: EdgeInsets.all(10.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.h),
            border: Border.all(
              color: const Color(0xffEEBB49),
            )),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(1.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.h),
                color: const Color(0xffEEBB49),
              ),
              child: Icon(
                icon,
                color: Colors.black,
              ),
            ),
            SizedBox(width: 10.w),
            Text(
              title,
              style: Styles.textStyleTitle16,
            ),
            const Spacer(),
            Icon(Icons.arrow_forward_ios, size: 20.h),
          ],
        ),
      ),
    );
  }
}
