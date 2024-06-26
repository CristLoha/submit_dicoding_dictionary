import 'package:flutter/material.dart';
import '../shared/theme.dart';

class AppInput extends StatelessWidget {
  final TextEditingController? controller;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool? obscureText;
  final String? initialValue;
  final Color? colorBorder;
  final String? hintText;
  final Function(String)? onChanged;

  const AppInput({
    Key? key,
    this.controller,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText,
    this.hintText = "Cari semua kata...",
    this.initialValue,
    this.colorBorder,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      cursorColor: darkBlue,
      textCapitalization: TextCapitalization.sentences,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: greyTextStyle,
        prefixIconColor: greyColor,
        prefixIcon: prefixIcon,
        fillColor: whiteColor,
        filled: true,
        suffixIcon: suffixIcon,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(
            color: shamrockGreen,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: whiteColor),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            14,
          ),
          borderSide: BorderSide(
            color: oldRose,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            14,
          ),
          borderSide: BorderSide(
            color: oldRose,
          ),
        ),
      ),
    );
  }
}
