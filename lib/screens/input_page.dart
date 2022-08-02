import 'package:bmicalculator_app/screens/results_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/icon_content.dart';
import '../components/reusable_card.dart';
import '../constants.dart';
import 'results_screen.dart';
import '../components/bottom_button.dart';
import 'package:bmicalculator_app/calculator_brain.dart';

enum Gender { MALE, FEMALE }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int height = 180;
  int wight = 80;
  int age = 25;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('BMI CALCULATOR')),
        ),
        body: SafeArea(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            Expanded(
                child: Row(
              children: [
                Expanded(
                    child: ReusableCard(
                  colour: selectedGender == Gender.MALE
                      ? kactiveCardColor
                      : kinactiveCardColor,
                  cardChild: IconContent(
                    icon: FontAwesomeIcons.mars,
                    label: 'MALE',
                  ),
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.MALE;
                    });
                  },
                )),
                Expanded(
                    child: ReusableCard(
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.FEMALE;
                    });
                  },
                  colour: selectedGender == Gender.FEMALE
                      ? kactiveCardColor
                      : kinactiveCardColor,
                  cardChild: IconContent(
                    icon: FontAwesomeIcons.venus,
                    label: 'FEMALE',
                  ),
                )),
              ],
            )),
            Expanded(
                child: ReusableCard(
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Height",
                    style: klabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: kNumberTextStyle,
                      ),
                      Text(
                        "cm",
                        style: klabelTextStyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderThemeData(
                        thumbColor: Color(0xFFEB1555),
                        overlayColor: Color(0x29EB1555),
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: Colors.grey,
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30.0)),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
              onPress: () {},
              colour: kactiveCardColor,
            )),
            Expanded(
                child: Row(children: [
              Expanded(
                child: ReusableCard(
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.MALE;
                    });
                  },
                  colour: kactiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "WEIGHT",
                        style: klabelTextStyle,
                      ),
                      Text(
                        wight.toString(),
                        style: kNumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPress: () {
                              setState(() {
                                wight++;
                              });
                            },
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPress: () {
                              setState(() {
                                (wight > 0) ? wight-- : wight;
                              });
                            },
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                  child: ReusableCard(
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.FEMALE;
                        });
                      },
                      colour: kactiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "AGE",
                            style: klabelTextStyle,
                          ),
                          Text(age.toString(), style: kNumberTextStyle),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPress: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPress: () {
                                  setState(() {
                                    (age > 0) ? age-- : age;
                                  });
                                },
                              )
                            ],
                          )
                        ],
                      ))),
            ])),
            BottomButton(
              title: 'Calculator',
              onTap: () {
                CalculatorBrain calc =
                    CalculatorBrain(height: height, weight: wight);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResultScreen(
                              bmiResult: calc.calculateBMI(),
                              resultText: calc.getResult(),
                              interpretation: calc.getInterpreation(),
                            )));
              },
            )
          ]),
        ));
  }
}

class RoundIconButton extends StatelessWidget {
  final IconData? icon;
  final VoidCallback? onPress;
  RoundIconButton({this.icon, this.onPress});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onPress,
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      elevation: 6.0,
      disabledElevation: 6.0,
      constraints: BoxConstraints.tightFor(width: 56, height: 56),
    );
  }
}
