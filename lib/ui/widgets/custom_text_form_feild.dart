import 'package:evently/utils/app_color.dart';
import 'package:flutter/material.dart';

class CustomTextFormFeild extends StatefulWidget {
  String hintText;

  Icon? prefixIcon;
  Icon? sufixIcon;

  CustomTextFormFeild({
    super.key,
    required this.hintText,
    this.prefixIcon,
    this.sufixIcon,
  });

  @override
  State<CustomTextFormFeild> createState() => _CustomTextFormFeildState();
}

class _CustomTextFormFeildState extends State<CustomTextFormFeild> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintStyle: Theme.of(context).textTheme.headlineMedium,
        hintText: widget.hintText,
        prefixIcon: widget.prefixIcon,
        prefixIconColor: AppColor.disableGrey,
        suffixIconColor: AppColor.disableGrey,
        suffixIcon: widget.sufixIcon,
        enabledBorder: _outlineInputBorder(),
        border: _outlineInputBorder(),
        focusedBorder: _outlineInputBorder(),
        errorBorder: _outlineInputBorder(),
        focusedErrorBorder: _outlineInputBorder(),
        filled: true,
        fillColor: Theme.of(context).colorScheme.onPrimary,
      ),
    );
  }

  OutlineInputBorder _outlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(
        color: Theme.of(context).colorScheme.onPrimaryContainer,
        width: 2,
      ),
    );
  }
}
