import 'package:flutter/material.dart';

class NoPaddingTextButton extends StatelessWidget {
  Widget child;
  VoidCallback onPressed;
  NoPaddingTextButton({required this.child, required this.onPressed ,super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: TextButton.styleFrom(
          minimumSize: Size.zero,
          padding: EdgeInsets.zero,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,                        ),
        onPressed: (){}, child: child,
    );
  }
}
