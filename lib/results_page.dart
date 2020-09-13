import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/input_page.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'calculator_brain.dart';

class ResultsPage extends StatelessWidget {
  final String bmi;
  final String weightStatus;
  final Color statusColor;
  final String resultMsg;

  const ResultsPage(
      {@required this.bmi,
      @required this.weightStatus,
      @required this.resultMsg,
      @required this.statusColor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Text(
                'Your Results',
                style: TextStyle(
                  fontSize: 50.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              myColor: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    this.weightStatus.split('.')[1].toUpperCase(),
                    style: TextStyle(
                      fontSize: 35.0,
                      color: this.statusColor,
                    ),
                  ),
                  Text(
                    this.bmi,
                    style: kBMITextStyle,
                  ),
                  Text(
                    this.resultMsg,
                    style: kLargeTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => InputPage()),
              );
            },
            child: Container(
              child: Center(
                child: Text(
                  'RECALCULATE',
                  style: kLargeTextStyle,
                ),
              ),
              color: kBottomContainerColor,
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: kBottomContainerHeight,
              padding: EdgeInsets.only(bottom: 10.0),
            ),
          )
        ],
      ),
    );
  }
}
