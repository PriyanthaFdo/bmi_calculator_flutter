import 'package:flutter/material.dart';
import '../constants.dart';

class IconTitle extends StatelessWidget {
  final IconData icon;
  final String label;

  const IconTitle({
    super.key,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: kLargeFontSize,
        ),
        const SizedBox(
          height: 20,
        ),
        Text(label, style: kPrimaryTextStyle)
      ],
    );
  }
}
