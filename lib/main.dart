import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/material.dart';
import 'package:practica2dm/Screens/MainMenu.dart';
import 'package:practica2dm/Tools/SessionData.dart';
import 'package:practica2dm/Tools/TimerData.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await AndroidAlarmManager.initialize();
  runApp(
    ChangeNotifierProvider<TimerData>(
      create: (_) => TimerData(),
      child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Provider(
      create: (context) => SessionDatabase(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MainMenu()
      ),
    );
  }
}


