import 'package:flutter/material.dart';

import '../const/Styles.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final String? hintText;
  final Widget? prefix;
  final String? initValue;
  final bool? enable;

  final FormFieldValidator<String>? validator;
  const CustomTextFormField({
    super.key,
    this.controller,
    this.textInputType = TextInputType.text,
    this.hintText,
    this.prefix,
    this.validator,
    this.initValue,
    this.enable=true,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      enabled: enable,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: Styles.textStyleTitle16,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(
            color: Colors.blue,
            width: 2.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(
            color: Color(0xffC19843),
            width: 2.0,
          ),
        ),

        prefixIcon: prefix,
        // style: textStyle ?? CustomTextStyles.titleMedium16,
        // obscureText: obscureText!,
      ), // textInputAction: textInputAction,
      keyboardType: textInputType,
      // maxLines: maxLines ?? 1,
      // decoration: decoration,
      validator: validator,
    );
  }
}
