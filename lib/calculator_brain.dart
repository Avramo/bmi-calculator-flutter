import 'package:flutter/material.dart';
import 'dart:math';

enum WeightStatus {
  underweight,
  normal,
  overweight,
  obese,
}

class CalculatorBrain {
  CalculatorBrain({this.weight, this.height, this.age});

  final int weight;
  final int height;
  final int age;
  double _bmi;
  WeightStatus _weightStatus;

  String calculateBMI() {
    _bmi = weight / pow((height / 100), 2);
    return _bmi.toStringAsFixed(1);
  }

  String getWeightStatus() {
    if (_bmi < 18.50) {
      _weightStatus = WeightStatus.underweight;
    } else if (_bmi >= 18.50 && _bmi <= 24.9) {
      _weightStatus = WeightStatus.normal;
    } else if (_bmi >= 25.0 && _bmi <= 29.9) {
      _weightStatus = WeightStatus.overweight;
    } else {
      _weightStatus = WeightStatus.obese;
    }
    return _weightStatus.toString();
  }

  Color getStatusColor() {
    switch (_weightStatus) {
      case WeightStatus.underweight:
        return Colors.yellow;
        break;
      case WeightStatus.normal:
        return Colors.green;
        break;
      case WeightStatus.overweight:
        return Colors.deepOrangeAccent;
        break;
      case WeightStatus.obese:
        return Colors.red;
        break;
      default:
        return Colors.white;
    }
  }

  String getMsg() {
    switch (_weightStatus) {
      case WeightStatus.underweight:
        return 'Talk with your healthcare provider to determine possible causes of underweight and if you need to gain weight.';
        break;
      case WeightStatus.normal:
        return 'Maintaining a healthy weight may reduce the risk of chronic diseases associated with overweight and obesity.';
        break;
      case WeightStatus.overweight:
        return 'Anyone who is overweight should try to avoid gaining additional weight. Even a small weight loss may help lower the risk of disease.';
        break;
      case WeightStatus.obese:
        return 'Talk with your healthcare provider to determine appropriate ways to lose weight.';
        break;
      default:
        return 'error';
    }
  }
}
