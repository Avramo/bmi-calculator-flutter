import 'package:bmi_calculator/round_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'constants.dart';

class NumberButtonsCard extends StatelessWidget {
  final int numberLabel;
  final String textLabel;
  final Function minusFunction;
  final Function plusFunction;

  const NumberButtonsCard(
      {@required this.numberLabel,
      @required this.textLabel,
      @required this.minusFunction,
      @required this.plusFunction});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          this.textLabel,
          style: kLabelTextStyle,
        ),
        Text(
          this.numberLabel.toString(),
          style: kNumberTextStyle,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RoundIconButton(
              icon: FontAwesomeIcons.minus,
              onPress: minusFunction,
            ),
            SizedBox(
              width: 10.0,
            ),
            RoundIconButton(
              icon: FontAwesomeIcons.plus,
              onPress: plusFunction,
            )
          ],
        ),
      ],
    );
  }
}
