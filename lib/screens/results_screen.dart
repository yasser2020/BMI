import 'package:bmicalculator_app/constants.dart';
import 'package:flutter/material.dart';
import '../components/reusable_card.dart';
import '../components/bottom_button.dart';
import 'input_page.dart';

class ResultScreen extends StatelessWidget {
  final String? bmiResult;
  final String? resultText;
  final String? interpretation;
  ResultScreen(
      {required this.bmiResult,
      required this.resultText,
      required this.interpretation});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Your Result"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              alignment: Alignment.bottomLeft,
              margin: EdgeInsets.all(20),
              child: Text(
                "Your Result",
                style: kLarageTextStyle,
              ),
              padding: EdgeInsets.all(15),
            ),
            Expanded(
              flex: 5,
              child: ReusableCard(
                  colour: kactiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        resultText.toString(),
                        style: kTextWeightResultStyle,
                      ),
                      SizedBox(
                        height: 80.0,
                      ),
                      Text(
                        bmiResult.toString(),
                        style: kNumberTextStyle,
                      ),
                      SizedBox(
                        height: 70,
                      ),
                      Text(
                        interpretation.toString(),
                        style: kTextResultStyle,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  )),
            ),
            BottomButton(
              title: "Re-Calculate",
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => InputPage()));
              },
            )
          ],
        ));
  }
}
