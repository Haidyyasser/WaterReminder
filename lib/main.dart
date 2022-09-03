
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:projectt/Contain.dart';
import 'package:projectt/button.dart';
import 'package:projectt/notify.dart';
import 'package:projectt/services/notification_service.dart';
import 'package:projectt/services/themes_services.dart';
import 'package:projectt/themes.dart';
import 'package:projectt/water.dart';
import 'add_reminder.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    initialRoute: "/",
    // onGenerateRoute: (settings){
    //   if(settings.name=="/Reminder"){
    //     final args =settings.arguments as ScreenArgs;
    //     return MaterialPageRoute(builder: (context)
    //     {
    //       return Reminder(name:args.name);
    //     });
    //   }
    // },
    routes: {
      "/":(context)=>MyApp(),
    },
  ));

}
class MyApp extends StatelessWidget {
 const  MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: SplashScreen(
      ),
    );
  }

}
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();

}

class _SplashScreenState extends State<SplashScreen> {
   @override
  void initState() {
     super.initState();
   Future.delayed(Duration(seconds:3)).then((value) {
     Navigator.of(this.context).pushReplacement(
       CupertinoPageRoute(builder: (ctx)=> const HomeScreen()));
   });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const[
            Image(image: AssetImage('images/water.png'),
              width: 300,
            ),
            SizedBox(
             height: 50,
            ),
             SpinKitPouringHourGlassRefined(
        color: Colors.lightBlueAccent,
            size: 50.0,
    )
          ],
        ),
      ),
    );
  }
}
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}


  class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
  return MaterialApp(


  home:Scaffold(
  appBar: AppBar(
  title: Text("Water Reminder"),
  leading: IconButton(onPressed: (){},icon: Icon(Icons.menu),),

  ),
  body: Center(
  child: Container(
  width: double.infinity,
  height: double.infinity,
  decoration: BoxDecoration(
  image: DecorationImage(
  image: AssetImage('images/pointerr.png'),
  fit: BoxFit.none,
  ),
  ),
  padding: EdgeInsets.all(70),
  child:Column(

  children: [
  Text("We will remind you, Please sign in",
  style: TextStyle(fontSize:30, color: Colors.black87,backgroundColor: Colors.grey),
  textAlign: TextAlign.center,
  ),

  ElevatedButton(
  onPressed: () {
  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Login()));
  },
  child: Text('Sign in',
  style: TextStyle(fontSize: 30),
  textAlign: TextAlign.center,
  ),
  ),
  SizedBox(height: 210,),
  ElevatedButton(
  onPressed: () {
  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>water()));
  },
  child: Text('Importance of water',
  style: TextStyle(fontSize: 20),
  textAlign: TextAlign.center,
  ),
  ),
  ],
  ),
  ),
  ),
  ),
  );
  }
  }

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);
  TextEditingController username=TextEditingController();

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var fromKey = GlobalKey<FormState>();

  void submit() {
    final isValid = fromKey.currentState!.validate();
    if (!isValid) return;
    fromKey.currentState!.save();
  }

  get username => null;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(title: Text("Log in"),),
        body: Form(
          key: fromKey,


          // padding:EdgeInsets.all(15),
          child: Padding(
              padding: EdgeInsets.all(15.0),

              child: Column(

                children: [
                  TextFormField(
                    //  padding: EdgeInsets.all(10),
                    // child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Username",

                        hintText: "Enter your username"

                    ),
                    keyboardType: TextInputType.text,

                    validator: (value) {
                      RegExp regExp = new RegExp(r'[A-Z][a-z]{1,7}$');
                      if (value!.isEmpty) {
                        return 'Please enter your username';
                      } else if (!regExp.hasMatch(value)) {
                        return "Username must be at most 8 characters& 1st letter must be capital";
                      }
                      return null;
                    },


                  ),


                  SizedBox(height: 30),

                  TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Password",
                        hintText: "Enter your password"
                    ),
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    validator: (value) {
                      RegExp regExp = new RegExp(r'\w{8,}$');
                      if (value!.isEmpty) {
                        return 'Please enter your password';
                      } else if (!regExp.hasMatch(value)) {
                        return "Password must bs at least 8 characters";
                      }
                      return null;
                    },
                  ),
                  Container(
                    child: ElevatedButton(
                      onPressed: () {
                        if (fromKey.currentState!.validate()) {
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) =>
                                  Reminder()));
                        }
                      },
                      child: Text("Login"),

                    ),

                  ),
                  SizedBox(
                    height: 150,
                  ),
                  Container(

                    width: 200,
                    height: 183,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('images/watercup.png'),
                        fit: BoxFit.fill,
                      ),

                    ),
                  ),


                ],
              )
          ),
        ),
      ),
    );
  }
}
class Reminder extends StatefulWidget {
  const Reminder({Key? key}) : super(key: key);

  @override
  State<Reminder> createState() => _ReminderState();
}
class _ReminderState extends State<Reminder> {
  final Stream<QuerySnapshot> _remindStream =
  FirebaseFirestore.instance.collection('reminders').snapshots();
  DateTime _selectedDate=DateTime.now();
  //final _taskController = Get.put(TaskController());
  var notifyHelper;
  @override
void initState() {
    // TODO: implement initState
    super.initState();
    notifyHelper=NotifyHelper();
    notifyHelper.initializeNotification();
     notifyHelper.requestIOSPermissions();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: Themes.light,
      darkTheme: Themes.dark,
      themeMode: ThemeService().theme,
        home: Scaffold(
        appBar: _appBar(),

    body:  Column(
    children: [
      _addReminder(),
      _addDate(),
      //_showTasks(),

      StreamBuilder<QuerySnapshot>(
          stream: _remindStream,
          builder: (BuildContext context,
              AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return const Text('Something went wrong');
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            }
            return ListView(

              shrinkWrap: true,
              children:
              snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data =
                document.data()! as Map<String, dynamic>;
                return ListTile(
                  iconColor: Colors.lightBlue,
                  leading: Icon(Icons.local_drink),
                  title: Text(data['title']),
                  subtitle: Text(data['note']),
                );
              }).toList(),
            );
          })
    ],
    ),
    ),

    );
  }

  // _showTasks(){
  //   return Expanded(child:
  //   Obx((){
  //     return ListView.builder(
  //         itemCount: _taskController.taskList.length,
  //         itemBuilder:(_,context){
  //           print(_taskController.taskList.length);
  //       return Container(
  //         width: 100,
  //         height: 50,
  //         color: Colors.green,
  //
  //       );
  //     } );
  //   }
  //   ),
  //   );
  // }
  _addDate(){
    return  Container(
      margin: EdgeInsets.only(top: 20,left: 10),
      child: DatePicker(
        DateTime.now(),
        height: 100,
        width: 80,
        initialSelectedDate: DateTime.now(),
        selectionColor: Colors.lightBlueAccent,
        selectedTextColor: Colors.white,
        dateTextStyle: GoogleFonts.atma(
          textStyle:TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,

          ),
        ),
        dayTextStyle: GoogleFonts.atma(
          textStyle:TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),

        ),
        monthTextStyle: GoogleFonts.atma(
          textStyle:TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,

          ),

        ),

      ),

    );
  }
  _addReminder(){
   return Container(
      margin: EdgeInsets.only(right: 20,left: 20,top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(

            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(DateFormat.yMMMd().format(DateTime.now()),
                  style: subHeadingStyle,
                ),

                Text("Today",
                  style:headingStyle,
                ),
              ],
            ),
          ),
    ElevatedButton(
    child: Text("you drunk"),
    onPressed: () {
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const AddReminder()));
    },
    ),
          ElevatedButton(
            child: Text("Remind me"),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const notify()));
            },
          ),
        ],
      ),

    );

  }
  _appBar(){
    return AppBar(
      title:Text("Reminder"),
      leading: GestureDetector(
        onTap: (){
          ThemeService().switchTheme();
          notifyHelper.displayNotification(
            title:"ThemeChanged",
            body:Get.isDarkMode?"ActivatedLight":"ActivatedDark",
          );
          notifyHelper.scheduledNotification();
        },
        child: Icon(Get.isDarkMode ?Icons.wb_sunny_outlined : Icons.nightlight_outlined,
          size: 20,
        ),
      ),
      actions: [
        Icon(Icons.person,size: 20,),
        SizedBox(width: 20,)
      ],
    );
  }
}

Widget buildRem(reminderr remd) => ListTile(
  leading: CircleAvatar(child: Text("Reminder"),),
  title: Text(remd.title),
  subtitle: Text(remd.note),

);
Stream<List<reminderr>> readRem () => FirebaseFirestore.instance
    .collection('reminders')
    .snapshots()
    .map((snapshot) =>
        snapshot.docs.map((doc)=>reminderr.fromJson(doc.data())).toList()
    );


Future CreateRem ({required String name}) async{
  final Rem = FirebaseFirestore.instance.collection('reminders').doc('my-id');
final user=reminderr(
  title: 'title',
  note: 'note',


);


final json = user.toJson();
await Rem.set(json);

  
  
}
class  reminderr{

final String title;
   final String  note;

  reminderr( {
    required this.note,
   required this.title,


});
  Map<String, dynamic>toJson()=> {
    'title':title,
    'note':note

  };
  static reminderr fromJson(Map<String, dynamic> json)=> reminderr(
    title: json['title'],
    note:  json['note'],

  );

}