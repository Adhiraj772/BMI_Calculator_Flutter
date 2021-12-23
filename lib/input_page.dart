import 'package:bmi_calculator/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';
import 'constants.dart';
import 'results_page.dart';
enum Gender {
  male,female
}
class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
Gender selectedGender;
int height = 180;
int weight=80;
int age=19;
  // Color maleCardColour=inactiveCardColour;
  // Color femaleCardColour = inactiveCardColour;
  // //1 = male, 2=female
  // void updateColour(Gender selectedGender){
  //   if(selectedGender==Gender.male){
  //     if(maleCardColour==inactiveCardColour){
  //       maleCardColour=activeCardColour;
  //       femaleCardColour=inactiveCardColour;
  //     }else{
  //       maleCardColour=inactiveCardColour;
  //   }
  //   }
  //   if(selectedGender==Gender.female){
  //     if(femaleCardColour==inactiveCardColour){
  //       femaleCardColour=activeCardColour;
  //       maleCardColour=inactiveCardColour;
  //     }
  //     else{
  //       femaleCardColour=inactiveCardColour;
  //     }
  //   }
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
              child:Row(
                children: <Widget>[
                  Expanded(
                      child: ReusableCard(
                        onPress: (){
                          setState(() {
                            selectedGender=Gender.male;
                          });
                        },
                        colour: selectedGender==Gender.male? kActiveCardColour : kInactiveCardColour,
                      cardChild: IconContent(icon: FontAwesomeIcons.mars,label: 'MALE',),
                      ),
                  ),
                  Expanded(
                      child:ReusableCard(
                        onPress: (){
                          selectedGender=Gender.female;
                        },
                        colour: selectedGender==Gender.female? kActiveCardColour : kInactiveCardColour,
                      cardChild: IconContent(icon: FontAwesomeIcons.venus,label: 'FEMALE',),
                      ),
                  ),
                ],
              ) ,
          ),
          Expanded(
              child: ReusableCard(
                  colour: kInactiveCardColour,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children:<Widget> [
                    Text('HEIGHT',style: kLabelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:<Widget> [
                        Text(height.toString(),
                        style:kNumberTextStyle,
                        ),
                        Text('cm',style: kNumberTextStyle,)
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        inactiveTrackColor:  Color(0XFF8D8E98),
                        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                        thumbColor: Color(0xFFEB1555),
                        overlayColor: Color(0x29EB1555),
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        onChanged: (double newValue){
                          setState(() {
                            height=newValue.round();
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
          ),
          Expanded(child: Row(
            children: <Widget>[
              Expanded(
                child: ReusableCard(colour: kActiveCardColour,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:<Widget> [
                    Text('WEIGHT',
                    style:kLabelTextStyle,
                    ),
                    Text(weight.toString(),
                    style: kNumberTextStyle,
                    ),
                    Row(
                      children:<Widget> [
                        RoundIconButton(icon: FontAwesomeIcons.minus,
                        onPressed: (){
                          setState(() {
                            weight--;
                          });
                        },),
                        SizedBox(width: 10.0),
                        RoundIconButton(icon: FontAwesomeIcons.plus,
                        onPressed: (){
                          setState(() {
                            weight++;
                          });
                        },),
                      ],
                    ),

                  ],
                ),
                ),
              ),
              Expanded(
                  child: ReusableCard(colour: kActiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:<Widget> [
                        Text('AGE',
                          style:kLabelTextStyle,
                        ),
                        Text(age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          children:<Widget> [
                            RoundIconButton(icon: FontAwesomeIcons.minus,
                              onPressed: (){
                                setState(() {
                                  age--;
                                });
                              },),
                            SizedBox(width: 10.0),
                            RoundIconButton(icon: FontAwesomeIcons.plus,
                              onPressed: (){
                                setState(() {
                                  age++;
                                });
                              },),
                          ],
                        ),

                      ],
                    ),
                  ),
              ),
            ],
          ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => ResultsPage()));
            },
            child: Container(
              child: Text('CALCULATE'),
              color: kBottomContainerColour ,
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: kBottomContainerHeight,
            ),
          )
        ],
      ),

    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({@required this.icon,@required this.onPressed});
  final IconData icon;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onPressed,
      elevation: 0.0,
      shape:CircleBorder(),
      fillColor:Color(0xFF4C4F5E),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
    );
  }
}




