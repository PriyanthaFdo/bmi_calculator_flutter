import 'package:flutter/material.dart';
import '../constants.dart';

class ScreenBottomButton extends StatelessWidget {
  final String label;
  final Function() onTap;

  const ScreenBottomButton(
      {super.key, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: kBottomBtnHeight,
        color: kPrimaryContrastColor,
        child: Padding(
          padding: const EdgeInsets.only(
            bottom: 15.0,
            top: 10.0,
          ),
          child: Center(
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
