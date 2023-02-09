import 'package:bmi_calculator_flutter/constants.dart';
import 'package:bmi_calculator_flutter/components/reusable_container.dart';
import 'package:bmi_calculator_flutter/components/screen_bottom_button.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator_flutter/bmi_calculator_brain.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final result =
        ModalRoute.of(context)!.settings.arguments as BmiCalculatorBrain;
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator Results'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(
            height: 20,
          ),
          Center(
            child: Text(
              'Your Results',
              style: kLargeTextStyle.copyWith(
                fontSize: 45,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          ReusableContainer(
            colour: kActiveContainerColor,
            margin: 20,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  result.getBmiResultText(),
                  style: const TextStyle(
                    fontSize: 30,
                    color: Color(0xFF49a634),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  result.getBmiValue(),
                  style: kLargeTextStyle.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  result.getBmiInterpretation(),
                  style: kPrimaryTextStyle,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          ScreenBottomButton(
            label: 'Re-Calculate',
            onTap: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
