import 'package:bmi_calculator/number_buttons_card.dart';
import 'package:bmi_calculator/results_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'icon_content.dart';
import 'constants.dart';
import 'round_icon_button.dart';
import 'calculator_brain.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 30;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        this.selectedGender = Gender.male;
                      });
                    },
                    myColor: this.selectedGender == Gender.male
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.male,
                      label: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        this.selectedGender = Gender.female;
                      });
                    },
                    myColor: selectedGender == Gender.female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.female,
                      label: 'FEMALE',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'HEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(height.toString(), style: kNumberTextStyle),
                            Text(
                              'cm',
                              style: kLabelTextStyle,
                            ),
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                              thumbShape: RoundSliderThumbShape(
                                  enabledThumbRadius: 15.0),
                              thumbColor: kBottomContainerColor,
                              overlayShape:
                                  RoundSliderOverlayShape(overlayRadius: 25.0),
                              overlayColor:
                                  kBottomContainerColor.withAlpha(0x29),
                              activeTrackColor: Colors.white),
                          child: Slider(
                            inactiveColor: Color(0xFF8d8e98),
                            value: this.height.toDouble(),
                            onChanged: (double newValue) {
                              print(newValue);
                              setState(() {
                                this.height = newValue.toInt();
                              });
                            },
                            min: 120.0,
                            max: 220.0,
                          ),
                        )
                      ],
                    ),
                    myColor: kActiveCardColor,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    myColor: kActiveCardColor,
                    cardChild: NumberButtonsCard(
                      textLabel: 'WEIGHT',
                      numberLabel: this.weight,
                      minusFunction: () {
                        setState(() {
                          this.weight--;
                        });
                        print('weight:  $weight ');
                      },
                      plusFunction: () {
                        setState(() {
                          this.weight++;
                          print('weight: $weight');
                        });
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    myColor: kActiveCardColor,
                    cardChild: NumberButtonsCard(
                        numberLabel: this.age,
                        textLabel: 'AGE',
                        minusFunction: () {
                          setState(() {
                            this.age--;
                          });
                        },
                        plusFunction: () {
                          setState(() {
                            this.age++;
                          });
                        }),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              CalculatorBrain calc = CalculatorBrain(
                weight: this.weight,
                height: this.height,
                age: this.age,
              );

              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ResultsPage(
                          bmi: calc.calculateBMI(),
                          weightStatus: calc.getWeightStatus(),
                          statusColor: calc.getStatusColor(),
                          resultMsg: calc.getMsg(),
                        )),
              );
            },
            child: Container(
              child: Center(
                child: Text(
                  'CALCULATE',
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
