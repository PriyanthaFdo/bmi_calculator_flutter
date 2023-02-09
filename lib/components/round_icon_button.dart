import 'package:flutter/material.dart';
import '../constants.dart';

const buttonSize = 50.0;

class RoundIconButton extends StatelessWidget {
  const RoundIconButton({Key? key, required this.icon, this.onPressed})
      : super(key: key);

  final Function()? onPressed;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          fixedSize: const Size.square(buttonSize),
          backgroundColor: kSecondaryContrastColor),
      onPressed: onPressed,
      child: icon,
    );
  }
}
