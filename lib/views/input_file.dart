import 'package:bmi_calculator_flutter/bmi_calculator_brain.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/reusable_container.dart';
import '../components/icon_title.dart';
import '../constants.dart';
import '../components/round_icon_button.dart';
import '../components/screen_bottom_button.dart';

enum Gender {
  nul,
  male,
  female,
}

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender = Gender.nul;
  int height = 180;
  int weight = 50;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                ReusableContainer(
                  colour: selectedGender == Gender.male
                      ? kActiveContainerColor
                      : kInactiveContainerColor,
                  child: const IconTitle(
                    icon: FontAwesomeIcons.mars,
                    label: 'MALE',
                  ),
                  onTap: () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                ),
                ReusableContainer(
                  colour: selectedGender == Gender.female
                      ? kActiveContainerColor
                      : kInactiveContainerColor,
                  child: const IconTitle(
                    icon: FontAwesomeIcons.venus,
                    label: 'FEMALE',
                  ),
                  onTap: () {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                ),
              ],
            ),
          ),
          ReusableContainer(
            colour: kActiveContainerColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'HEIGHT',
                  style: kPrimaryTextStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      height.toString(),
                      style: kLargeTextStyle,
                    ),
                    const Text(
                      'cm',
                      style: kPrimaryTextStyle,
                    )
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    activeTrackColor: Colors.white,
                    inactiveTrackColor: kSecondaryContrastColor,
                    thumbShape: const RoundSliderThumbShape(
                      enabledThumbRadius: 20,
                    ),
                    thumbColor: kPrimaryContrastColor,
                    overlayColor: kSecondaryContrastColor,
                    overlayShape: const RoundSliderOverlayShape(
                      overlayRadius: 35,
                    ),
                  ),
                  child: Slider(
                    min: 10,
                    max: 250,
                    value: height.toDouble(),
                    onChanged: (double newValue) {
                      setState(() {
                        height = newValue.round();
                      });
                    },
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                ReusableContainer(
                  colour: kActiveContainerColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'WEIGHT',
                        style: kPrimaryTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            weight.toString(),
                            style: kLargeTextStyle,
                          ),
                          const Text(
                            'kg',
                            style: kPrimaryTextStyle,
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                            onPressed: () {
                              setState(() {
                                weight <= 1 ? 1 : weight--;
                              });
                            },
                            icon: const Icon(
                              FontAwesomeIcons.minus,
                              color: kActiveContainerColor,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          RoundIconButton(
                            onPressed: () {
                              setState(() {
                                weight >= 300 ? 300 : weight++;
                              });
                            },
                            icon: const Icon(
                              FontAwesomeIcons.plus,
                              color: kActiveContainerColor,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                ReusableContainer(
                  colour: kActiveContainerColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'AGE',
                        style: kPrimaryTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            age.toString(),
                            style: kLargeTextStyle,
                          ),
                          const Text(
                            'yrs',
                            style: kPrimaryTextStyle,
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                            onPressed: () {
                              setState(() {
                                age <= 1 ? 1 : age--;
                              });
                            },
                            icon: const Icon(
                              FontAwesomeIcons.minus,
                              color: kActiveContainerColor,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          RoundIconButton(
                            onPressed: () {
                              setState(() {
                                age >= 150 ? 150 : age++;
                              });
                            },
                            icon: const Icon(
                              FontAwesomeIcons.plus,
                              color: kActiveContainerColor,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          ScreenBottomButton(
            label: 'Calculate',
            onTap: () {
              Navigator.pushNamed(context, '/results',
                  arguments: BmiCalculatorBrain(
                    weight: weight.toDouble(),
                    height: height.toDouble(),
                  ));
            },
          )
        ],
      ),
    );
  }
}
