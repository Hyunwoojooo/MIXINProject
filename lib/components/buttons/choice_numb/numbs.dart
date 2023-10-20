import 'package:flutter/material.dart';
//
class Numbs extends StatelessWidget {
  int numbs;

  Numbs({required this.numbs});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        child: Center(
          child: Text(
            numbs.toString(),
            style: TextStyle(
              fontSize: 24,
              fontFamily: 'SUIT',
              fontWeight: FontWeight.w600,
              color: Color(0xFF474747),
            ),
          ),
        ),
      ),
    );
  }
}
