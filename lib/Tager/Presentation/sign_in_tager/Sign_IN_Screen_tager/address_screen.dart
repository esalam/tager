import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:lottie/lottie.dart';

import 'package:tager/Tager/Presentation/animation_bg.dart';
import 'package:tager/Tager/Presentation/sign_in_tager/cubit/login_view_cubit.dart';
import 'package:tager/Tager/Presentation/sign_in_tager/cubit/login_view_state.dart';
import 'package:tager/Tager/Presentation/widgets/custom_head_screen.dart';

import '../../../core/const/Styles.dart';

import '../../../core/widget/Button.dart';
import '../../../core/widget/custom_text_form_field.dart';

class AddressScreen extends StatefulWidget {
  AddressScreen({super.key});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  var countryController = TextEditingController();

  var addressController = TextEditingController();

  var keyForm = GlobalKey<FormState>();
  late String locationMessage;
  late String lat;
  late String long;
  void getCurrentLocation() async {
    try {
      // Request permission to access the device's location
      LocationPermission permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        // Handle case when the user denies permission
        setState(() {
          locationMessage = "Location permission denied";
        });
        return;
      }

      // Get the current location
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      // Update the UI with the latitude and longitude
      setState(() {
        lat = " ${position.latitude}";
        long = "${position.longitude}";
        locationMessage =
            "Latitude: ${position.latitude}, Longitude: ${position.longitude}";
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginViewCubit(),
      child: BlocConsumer<LoginViewCubit, LoginViewState>(
        listener: (context, state) {},
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
                        width: double.infinity,
                        height: double.infinity,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                                'assets/images/img_constraction.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: Form(
                            key: keyForm,
                            child: SingleChildScrollView(
                              physics: const BouncingScrollPhysics(),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  customHeadScreen(),
                                  Container(
                                    alignment: Alignment.center,
                                    height: 100.h,
                                    child: Lottie.asset(
                                        'assets/images/address.json'),
                                  ),
                                  Text(
                                    'Country',
                                    style: Styles.textStyleTitle14,
                                  ),
                                  SizedBox(height: 10.h),
                                  CustomTextFormField(
                                      hintText: 'turkey',
                                      prefix: const Icon(
                                          Icons.location_city_rounded,
                                          color: Color(0xffC19843)),
                                      textInputType: TextInputType.text,
                                      controller: countryController,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'country is  empty';
                                        } else {
                                          return null;
                                        }
                                      }),
                                  SizedBox(height: 15.h),
                                  Text(
                                    'Address',
                                    style: Styles.textStyleTitle14,
                                  ),
                                  SizedBox(height: 10.h),
                                  CustomTextFormField(
                                      hintText: 'turkey / istanbul / moham**',
                                      prefix: const Icon(Icons.location_history,
                                          color: Color(0xffC19843)),
                                      textInputType: TextInputType.emailAddress,
                                      controller: addressController,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Address is  empty';
                                        } else {
                                          return null;
                                        }
                                      }),
                                  const SizedBox(height: 50),
                                  state is SendAddressLoading
                                      ? const Center(
                                          child: CircularProgressIndicator(
                                            color: Color(0xffEEBB49),
                                          ),
                                        )
                                      : Button(
                                          textButton: 'Send Address',
                                          funcation: () {
                                            getCurrentLocation();
                                            if (keyForm.currentState!
                                                .validate()) {
                                              BlocProvider.of<LoginViewCubit>(
                                                      context)
                                                  .SendAddress(
                                                lat: "37.6847351",
                                                long: "53.1521125",
                                                country: countryController.text,
                                                address: addressController.text,
                                                context: context,
                                              );
                                            }
                                          },
                                        ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ));
        },
      ),
    );
  }
}
