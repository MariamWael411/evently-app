import 'package:flutter/material.dart';

class CustomTextWidget extends StatelessWidget {
  CustomTextWidget({super.key, required this.text});

  String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(text, style: Theme.of(context).textTheme.displaySmall),
    );
  }
}
