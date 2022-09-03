import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:projectt/services/notification_service.dart';
import 'package:projectt/themes.dart';

import 'input_field.dart';
import 'main.dart';

class notify extends StatefulWidget {
  const notify({Key? key}) : super(key: key);

  @override
  State<notify> createState() => _notifyState();
}



class _notifyState extends State<notify> {
  var notifyHelper;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    notifyHelper = NotifyHelper();
    notifyHelper.initializeNotification();
    notifyHelper.requestIOSPermissions();
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: _appBar(),
        body: Container(
          padding: EdgeInsets.only(left: 10, right: 10, top: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Remind you every:",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),

                SizedBox(height: 20,),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          notifyHelper.scheduledNotification(
                            //id: 1,
                              title: "Drink",
                              body: "Time to drink some water!",
                              seconds: 2);
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Reminder()));
                        },
                        child: Text("2 sec"),
                      ),
                      SizedBox(width: 4,),
                      ElevatedButton(
                        onPressed: () {
                          notifyHelper.scheduledNotification(
                            //id: 1,
                              title: "Drink",
                              body: "Time to drink some water!",
                              seconds: 300);
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Reminder()));
                        },
                        child: Text("5 min"),
                      ),
                      SizedBox(width: 4,),
                      ElevatedButton(
                        onPressed: () {
                          notifyHelper.scheduledNotification(
                            //id: 1,
                              title: "Drink",
                              body: "Time to drink some water!",
                              seconds: 600);
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Reminder()));
                        },
                        child: Text("10 min"),
                      ),



                    ],

                  ),

                ),

                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        notifyHelper.scheduledNotification(
                          //id: 1,
                            title: "Drink",
                            body: "Time to drink some water!",
                            seconds: 1200);
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Reminder()));
                      },
                      child: Text("20 min"),
                    ),
                    SizedBox(width: 4,),
                    ElevatedButton(
                      onPressed: () {
                        notifyHelper.scheduledNotification(
                          //id: 1,
                            title: "Drink",
                            body: "Time to drink some water!",
                            seconds: 1800);
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Reminder()));
                      },
                      child: Text("30 min"),
                    ),
                    SizedBox(width: 4,),
                    ElevatedButton(
                      onPressed: () {
                        notifyHelper.scheduledNotification(
                          //id: 1,
                            title: "Drink",
                            body: "Time to drink some water!",
                            seconds: 2400);
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Reminder()));
                      },
                      child: Text("40 min"),
                    ),

                  ],

                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        notifyHelper.scheduledNotification(
                          //id: 1,
                            title: "Drink",
                            body: "Time to drink some water!",
                            seconds: 3000);
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Reminder()));
                      },
                      child: Text("50 min"),
                    ),
                    SizedBox(width: 4,),
                    ElevatedButton(
                      onPressed: () {
                        notifyHelper.scheduledNotification(
                          //id: 1,
                            title: "Drink",
                            body: "Time to drink some water!",
                            seconds: 3600);
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Reminder()));
                      },
                      child: Text("one hour"),
                    ),
                    SizedBox(width: 4,),
                    ElevatedButton(
                      onPressed: () {
                        notifyHelper.scheduledNotification(
                          //id: 1,
                            title: "Drink",
                            body: "Time to drink some water!",
                            seconds: 7200);
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Reminder()));
                      },
                      child: Text("two hours"),
                    ),



                  ],

                ),
              ],
            ),

          ),

        ),
      ),
    );
  }

  _appBar() {
    return AppBar(
      title: Text("Reminder"),
      leading: ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => Reminder()));
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
}
