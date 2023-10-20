import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  String? text;

  CustomTextButton({
    required this.text,
    Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return TextButton(

        onPressed: null,
        child: Text(
          '$text'
        ),
    );
  }
}
