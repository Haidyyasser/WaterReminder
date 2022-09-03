
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projectt/themes.dart';

class MyInputField extends StatelessWidget {
  final String title;
  final String hint;
  final TextEditingController? controller;
  final Widget? widget;
  const MyInputField({Key? key, required this.title,required this.hint,
  required this.controller,
    required this.widget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
          style: titleStyle,
          ),
          Container(
            height:52 ,
            margin: EdgeInsets.only(top: 8),
            padding: EdgeInsets.only(left: 10),
            // child:TextField(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1.5,
                ),
                borderRadius: BorderRadius.circular(12),
                 ),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(

                    readOnly: widget==null?false:true,
                    autofocus: false,
                    cursorColor: Colors.blue,
                    controller: controller,
                    style: subtitleStyle,
                    decoration: InputDecoration(
                      hintText: hint,
                      filled: true ,
                      hintStyle: subtitleStyle,
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black87
                        ),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.black87
                        ),
                      ),
                    ),

                  ),

                ),
                widget==null?Container():Container(child: widget,),
              ],
            ),

            ),

          
        ],
        
        
      ),
      
      
    );
  }
}
