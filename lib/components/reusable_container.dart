import 'package:flutter/material.dart';

const defaultReusableContainerMargin = 12.0;

class ReusableContainer extends StatelessWidget {
  final Color colour;
  final Widget? child;
  final double? margin;
  final void Function()? onTap;

  const ReusableContainer(
      {super.key, required this.colour, this.child, this.onTap, this.margin});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          margin: EdgeInsets.all(margin ?? defaultReusableContainerMargin),
          decoration: BoxDecoration(
            color: colour,
            borderRadius: BorderRadius.circular(10),
          ),
          child: child,
        ),
      ),
    );
  }
}
