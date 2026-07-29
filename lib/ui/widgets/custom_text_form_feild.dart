import 'package:evently/utils/app_color.dart';
import 'package:evently/utils/app_style.dart';
import 'package:flutter/material.dart';

typedef OnChanged=void Function(String);
typedef OnValidator=String? Function(String?);

class CustomTextFormFeild extends StatelessWidget {
  String hintText;

  Icon? prefixIcon;
  Icon? sufixIcon;
  int maxLines;
  OnChanged? onChanged;
  TextEditingController? controller;
  OnValidator? onValidator;

  CustomTextFormFeild({
    super.key,
    required this.hintText,
    this.prefixIcon,
    this.sufixIcon,
    this.maxLines = 1,
    this.controller,
    this.onChanged,
    this.onValidator
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      validator: onValidator,
      controller: controller,
      style: Theme
          .of(context)
          .textTheme
          .headlineMedium,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintStyle: Theme
            .of(context)
            .textTheme
            .headlineMedium,
        hintText: hintText,
        prefixIcon: prefixIcon,
        prefixIconColor: AppColor.disableGrey,
        suffixIconColor: AppColor.disableGrey,
        suffixIcon: sufixIcon,
        errorStyle: AppStyle.med14Red,
        enabledBorder: _outlineInputBorder(context),
        border: _outlineInputBorder(context),
        focusedBorder: _outlineInputBorder(context),
        errorBorder: _outlineInputBorder(context).copyWith(
          borderSide: BorderSide(
              color: AppColor.red
          ),
        ),
        focusedErrorBorder: _outlineInputBorder(context).copyWith(
          borderSide: BorderSide(
              color: AppColor.red
          ),
        ),
        filled: true,
        fillColor: Theme
            .of(context)
            .colorScheme
            .onPrimary,
      ),
    );
  }

  OutlineInputBorder _outlineInputBorder(BuildContext context) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(
        color: Theme
            .of(context)
            .colorScheme
            .onPrimaryContainer,
        width: 2,
      ),
    );
  }
}
