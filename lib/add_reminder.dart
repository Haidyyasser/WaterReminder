import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:projectt/input_field.dart';
import 'package:projectt/main.dart';
import 'package:projectt/services/notification_service.dart';
import 'package:projectt/themes.dart';
import 'models/task.dart';

class AddReminder extends StatefulWidget {
  const AddReminder({Key? key}) : super(key: key);

  @override
  State<AddReminder> createState() => _AddReminderState();
}

class _AddReminderState extends State<AddReminder> {
  var notifyHelper;
  late DatabaseReference _ref;
  TextEditingController _titleController =TextEditingController();
  TextEditingController _noteController =TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    notifyHelper=NotifyHelper();
    notifyHelper.initializeNotification();
    notifyHelper.requestIOSPermissions();
    _titleController = TextEditingController();
    _noteController = TextEditingController();
    _ref = FirebaseDatabase.instance.ref().child('reminder');
  }


  DateTime _selectedDate=DateTime.now();
  int _selectedRemind=5;
  List<int>remindList=[
    15,
    30,
    60,
    120,
    180,
  ];


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: _appBar(),
        body: Container(
          padding: EdgeInsets.only(left: 10,right: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Remind you",
                style: headingStyle,
                ),

                MyInputField(title: "Cups you drunk:", hint: "Enter number of cups", widget: null,controller: _titleController,),

                MyInputField(title: "Cups ml:", hint: "Enter in ml ", widget: null,controller: _noteController,),
                MyInputField(title: "Date", hint: DateFormat.yMd().format(_selectedDate),

                  widget: IconButton(icon: Icon(Icons.calendar_month,
                  color: Colors.blue[200],
                  ),
                          onPressed: (){
                            _getDate();
                             },
                            ),
                controller: null,
                    ),
                // MyInputField(title: "Remind", hint: "$_selectedRemind minutes",
                //   widget: null,
                //   // widget: DropdownButton(
                //   //   icon: Icon(Icons.local_drink,
                //   //     color: Colors.blue[200],
                //   //   ),
                //   //   iconSize: 23,
                //   //   //elevation: 1,
                //   //  //style: ,
                //   //   underline: Container(
                //   //     height: 0,
                //   //   ),
                //   //   onChanged: (String? newValue) {
                //   //     setState(() {
                //   //       _selectedRemind=int.parse(newValue!);
                //   //     });
                //   //   },
                //   //   items: remindList.map<DropdownMenuItem<String>>((int value){
                //   //     return DropdownMenuItem<String>(
                //   //       value: value.toString(),
                //   //       child: Text(value.toString()),
                //   //     );
                //   //   }
                //   //   ).toList(),
                //   // ),
                //   controller: null,),
                SizedBox(height: 20,),


                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                 // SizedBox(width: 30,)   ,

                      Center(
                      child:ElevatedButton(


                        onPressed: () {

                          final remd =reminderr(
                            title: _titleController.text,
                            note: _noteController.text,

                          );
                          CreateRem(remd);
                         Navigator.of(context).pop(context);
                        },
                        child: Text("Done",

                        ),
                      ),
                      ),
                    ],

                  ),
                ),


              ],
            ),

          ),

        ),
      ),
    );


  }
//   _validateDate(){
//     if(_titleController.text.isNotEmpty&&_noteController.text.isNotEmpty){
//   _addTaskToDB();
//       Get.back();
//
// }
//
//    else if(_titleController.text.isEmpty || _noteController.text.isEmpty ) {
//       Get.snackbar("Required", "All fields are required",
//         snackPosition: SnackPosition.BOTTOM,
//         backgroundColor: Colors.white,
//         icon: Icon(Icons.warning_amber),
//       );
//     }
//   }
// if(_titleController.text.isNotEmpty&&_noteController.text.isNotEmpty){
//   //add to database
//   Get.back();
//
// }else {
//    Get.snackbar("Required", "All fields are required",
//    snackPosition: SnackPosition.BOTTOM,
//      backgroundColor: Colors.white,
//      icon: Icon(Icons.warning_amber),
//    );

   saveReminder(){
    String title = _titleController.text;
    String note = _noteController.text;
    Map<String,String> reminder = {
      'title':title,
      'note':note,
    };
    _ref.push().set(reminder).then((value) {
      Navigator.pop(context);

    });

  }



_addTaskToDB(){
   task: Task(
      note:_noteController.text,
      title:_titleController.text,
      date:DateFormat().add_yMd().format(_selectedDate),
      remind:_selectedRemind,


    );

}
  _appBar() {
    return AppBar(
      title: Text("Reminder"),
      leading: ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Reminder()));
        },
        child: Icon(Icons.arrow_back,
          size: 20,
        ),
      ),
      actions: [
        Icon(Icons.person, size: 20,),
        SizedBox(width: 20,)
      ],
    );
  }
_getDate() async{
    DateTime? _pickerDate= await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate:DateTime(2015) ,
        lastDate: DateTime(2122));
    if(_pickerDate!=null){
      setState((){
        _selectedDate=_pickerDate;

      });


    }
    else
      {
        print("Something is wrong");
      }
}
}
    Future CreateRem (reminderr remd ) async {
      final Rem = FirebaseFirestore.instance.collection('reminders').doc();
      final json = remd.toJson();
      await Rem.set(json);
}




