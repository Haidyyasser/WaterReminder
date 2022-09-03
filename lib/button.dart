import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projectt/themes.dart';

class MyButton extends StatelessWidget {
  final String label;
  final Function()? onTap;
  const MyButton({Key? key,required this.label,required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        width: 100,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color:Colors.lightBlue,
        ),
      child:Row(
        children: [

          Container(
            margin: EdgeInsets.only(right: 10,left: 10,top: 10,bottom: 10),

            child: Text(
              label,
              textAlign: TextAlign.start,
              style: TextStyle(color: Colors.white,
                  fontSize: 22,
              ),


            ),
          ),
        ],
      ),
      ),
    );
  }
}
