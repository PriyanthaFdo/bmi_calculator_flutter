import 'package:flutter/material.dart';
import 'dart:math';

class BmiCalculatorBrain {
  late double _weight;
  late double _height;
  late double _bmi;

  BmiCalculatorBrain({required double weight, required double height}) {
    _weight = weight;
    _height = height;
    _bmi = _weight / pow(_height / 100, 2);
  }

  String getBmiValue() {
    return _bmi.toStringAsFixed(1);
  }

  String getBmiResultText() {
    if (_bmi < 18.5) {
      return 'Underweight';
    } else if (_bmi < 25) {
      return 'Normal';
    } else if (_bmi < 30) {
      return 'Overweight';
    } else {
      return 'Obesity';
    }
  }

  String getBmiInterpretation() {
    if (_bmi < 18.5) {
      return 'You are severely under eating. Stack up more food on your plate';
    } else if (_bmi < 25) {
      return 'Not too fat! Not too thin! You are just right!!';
    } else if (_bmi < 30) {
      return 'Hold up! You are eating too much. You are on your way to be Obese';
    } else {
      return 'Why are you eating so much!? You are already literally \'sick\' of eating!!';
    }
  }
}
