import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../Tager/core/const/consts.dart';
import '../app_cubit.dart';
import '../Tager/core/const/Styles.dart';

class BranchesScreen extends StatefulWidget {
  const BranchesScreen({super.key});

  @override
  State<BranchesScreen> createState() => _BranchesScreenState();
}

class _BranchesScreenState extends State<BranchesScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    AppCubit.get(context).getBranches(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
              body: Stack(
            children: [
              Container(
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
              ),
              ConditionalBuilder(
                condition: AppCubit.get(context).branchesModel != null,
                builder: (context) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20.h),
                        Center(
                          child: GradientText(
                            'MBAG',
                            style: Styles.textStyleTitle50
                            //     .copyWith(color: Color(
                            //     0xffBF953F
                            // ))
                            ,
                            gradientType: GradientType.values[0],
                            colors: const [
                              Color(0xffEEBB49),
                              Color(0xffD9D9D9)
                            ],
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Center(
                            child: Text(
                          name,
                          style: Styles.textStyleTitle18,
                        )),
                        SizedBox(height: 30.h),
                        Container(
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: const Color(0xffC19843)),
                              borderRadius: BorderRadius.circular(12)),
                          padding: const EdgeInsets.only(top: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Nearest branch',
                                      style: Styles.textStyleTitle18,
                                    ),
                                    SizedBox(height: 8.h),
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: SizedBox(
                                        height: 180,
                                        width: double.infinity,
                                        child: GoogleMap(
                                          zoomGesturesEnabled: false,
                                          scrollGesturesEnabled: false,
                                          tiltGesturesEnabled: false,
                                          rotateGesturesEnabled: false,
                                          zoomControlsEnabled: false,
                                          myLocationEnabled: true,
                                          myLocationButtonEnabled: false,
                                          initialCameraPosition: CameraPosition(
                                            target: LatLng(
                                              AppCubit.get(context)
                                                      .branchesModel!
                                                      .nearestBranch
                                                      ?.latitude ??
                                                  0.0,
                                              AppCubit.get(context)
                                                      .branchesModel!
                                                      .nearestBranch
                                                      ?.longitude ??
                                                  0.0,
                                            ),
                                            zoom: 15,
                                          ),
                                          markers: <Marker>{
                                            Marker(
                                              markerId: const MarkerId(
                                                  'initialLocation'),
                                              position: LatLng(
                                                AppCubit.get(context)
                                                        .branchesModel!
                                                        .nearestBranch
                                                        ?.latitude ??
                                                    0.0,
                                                AppCubit.get(context)
                                                        .branchesModel!
                                                        .nearestBranch
                                                        ?.longitude ??
                                                    0.0,
                                              ),
                                            ),
                                          },
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 8.h),
                                    Text(
                                      AppCubit.get(context)
                                              .branchesModel!
                                              .nearestBranch
                                              ?.name ??
                                          "",
                                      style: Styles.textStyleTitle18,
                                    ),
                                    SizedBox(height: 8.h),
                                    Text(
                                      AppCubit.get(context)
                                              .branchesModel!
                                              .nearestBranch
                                              ?.title ??
                                          "",
                                      style: Styles.textStyleTitle18,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 20.h),
                            ],
                          ),
                        ),
                        SizedBox(height: 30.h),
                        Text(
                          'Branches',
                          style: Styles.textStyleTitle18,
                        ),
                        SizedBox(height: 10.h),
                        ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) => Container(
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: const Color(0xffC19843)),
                                borderRadius: BorderRadius.circular(12)),
                            child: ListTile(
                              title: Text(
                                AppCubit.get(context)
                                    .branchesModel!
                                    .nearestBranches![index]
                                    .name!,
                                style: Styles.textStyleTitle16,
                              ),
                              subtitle: Text(
                                AppCubit.get(context)
                                    .branchesModel!
                                    .nearestBranches![index]
                                    .title!,
                                style: Styles.textStyleTitle16,
                              ),
                              trailing: const Icon(
                                Icons.arrow_forward_ios,
                                size: 20,
                              ),
                            ),
                          ),
                          separatorBuilder: (context, index) => SizedBox(
                            height: 20.h,
                          ),
                          itemCount: AppCubit.get(context)
                              .branchesModel!
                              .nearestBranches!
                              .length,
                          shrinkWrap: true,
                        ),
                        SizedBox(height: 20.h),
                      ],
                    ),
                  ),
                ),
                fallback: (context) => const Center(
                    child: CircularProgressIndicator(color: Color(0xffBF953F))),
              )
            ],
          )),
        );
      },
    );
  }
}
