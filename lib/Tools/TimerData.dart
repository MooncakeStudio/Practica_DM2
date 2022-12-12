import 'dart:async';

import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:practica2dm/Tools/SessionData.dart';
import 'package:provider/provider.dart';
import 'package:drift/drift.dart' as dr;

class TimerData extends ChangeNotifier{
  late Timer timer;
  double currentDuration = 1500;
  double selectedTime = 1500;
  bool isTimerPlaying = false;
  int rounds = 0;
  int goal = 0;
  int maxGoals = 5;
  String currentPhase = "FOCUS";

  void selectTime(double seconds){
    selectedTime = seconds;
    currentDuration = seconds;
    isTimerPlaying = false;
    timer = Timer.periodic(Duration.zero, (timer) { });
    timer.cancel();
    notifyListeners();
  }

  void selectMaxGoals(int goalSelected){
    maxGoals = goalSelected;
    notifyListeners();
  }

  void startSession(BuildContext context){
    isTimerPlaying = true;
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if(currentDuration == 0){
        handleNextRound(selectedTime, context);
      }else{
        currentDuration--;
        notifyListeners();
      }
    });
  }

  void pauseSession()
  {
    isTimerPlaying = false;
    timer.cancel();
    notifyListeners();
  }

  void resetTimer()
  {
    timer.cancel();
    currentPhase = "FOCUS";
    currentDuration = selectedTime;
    rounds = 0;
    isTimerPlaying = false;
  }

  static void callback(){print("Hola");}
  void handleNextRound(double selectedTimePrev, BuildContext context)
  {
    final database = Provider.of<SessionDatabase>(context, listen: false);
    var fecha = DateTime.now().year.toString() + "-" + DateTime.now().month.toString() + "-" + DateTime.now().day.toString();
    if(currentPhase == "FOCUS")
    {
      FlutterRingtonePlayer.playAlarm(asAlarm: true);
      new Timer(
        Duration(seconds:10),
          ()=>FlutterRingtonePlayer.stop()
      );
        print("Hola");
        database.insertSession(
            SessionDataCompanion(
                fecha: dr.Value(fecha),
                tiempo: dr.Value(selectedTime),
                state: dr.Value(currentPhase)
            )
        );
        currentPhase = "BREAK";
        currentDuration = selectedTimePrev * (300/1500);
        selectedTime = 300;
        rounds++;
        goal++;


    }
    else if(currentPhase == "BREAK")
    {
      FlutterRingtonePlayer.playAlarm();
      new Timer(
          Duration(seconds:5),
              ()=>FlutterRingtonePlayer.stop()
      );
        database.insertSession(
            SessionDataCompanion(
                fecha: dr.Value(fecha),
                tiempo: dr.Value(selectedTime),
                state: dr.Value(currentPhase)
            )
        );
        currentPhase = "FOCUS";
        currentDuration = selectedTimePrev;
        selectedTime = selectedTimePrev;


    }
    else if(currentPhase == "FOCUS" && rounds == 3)
    {
      FlutterRingtonePlayer.playAlarm();
      new Timer(
          Duration(seconds:10),
              ()=>FlutterRingtonePlayer.stop()
      );

      database.insertSession(
            SessionDataCompanion(
                fecha: dr.Value(fecha),
                tiempo: dr.Value(selectedTime),
                state: dr.Value(currentPhase)
            )
        );
        currentPhase = "LONGBREAK";
        currentDuration = selectedTimePrev;
        selectedTime = selectedTimePrev;
        rounds++;
        goal++;

    }
    else if(currentPhase == "LONGBREAK")
    {
      FlutterRingtonePlayer.playAlarm();
      new Timer(
          Duration(seconds:10),
              ()=>FlutterRingtonePlayer.stop()
      );
        database.insertSession(
            SessionDataCompanion(
                fecha: dr.Value(fecha),
                tiempo: dr.Value(selectedTime),
                state: dr.Value(currentPhase)
            )
        );
        currentPhase = "FOCUS";
        currentDuration = selectedTimePrev;
        selectedTime = selectedTimePrev;
        rounds = 0;


    }

    notifyListeners();
  }
}