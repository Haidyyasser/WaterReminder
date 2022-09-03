import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projectt/themes.dart';

class water extends StatelessWidget {
  const water({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Importance of water"),
        ),
        body:Padding(
          padding: EdgeInsets.only(left: 10,top: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Container(
                child: Text("+ Lower stress",
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueAccent, fontSize: 20),

                ),
              ),
              SizedBox(height: 5,),
              Container(
                child: Text("85% of your brain tissue is water. If you're dehydrated, both your body and your mind will be stressed",
                  style: waterStyle,
                ),
              ),
              SizedBox(height: 15,),
              Container(
                child: Text("+ Boosts your energy",
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueAccent, fontSize: 20),

                ),
              ),
              SizedBox(height: 5,),
              Container(
                child: Text("If you're feeling drained and depleted, drink more. Beign dehydrated makes you feel fatigued.",
                  style: waterStyle,
                ),
              ),
              SizedBox(height: 15,),
              Container(
                child: Text("+ Reduces kidney stones",
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueAccent, fontSize: 20),

                ),
              ),
              SizedBox(height: 5,),
              Container(
                child: Text("The rate of painful kidney stones is rising because people, including children, aren't drinking enough water.",
                  style: waterStyle,
                ),
              ),
              SizedBox(height: 15,),
              Container(
                child: Text("+ Stay slimmer",
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueAccent, fontSize: 20),

                ),
              ),
              SizedBox(height: 5,),
              Container(
                child: Text("Revs up metabolism and helps you feel fullReplace calorie-laden beverages with water and drink more before meals to help you feel fuller. weight maintain and over weight person to reduce weight , may help in weight loss.",
                  style: waterStyle,
                ),
              ),

            ],

          ),



        ),
      ),
    );
  }
}
