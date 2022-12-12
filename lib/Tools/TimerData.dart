import 'dart:async';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:practica2dm/Screens/FinishScene.dart';

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
    //final database = Provider.of<SessionDatabase>(context, listen: false);
    var fecha = DateTime.now().year.toString() + "-" + DateTime.now().month.toString() + "-" + DateTime.now().day.toString();

    if(currentPhase == "FOCUS")
    {
      FlutterRingtonePlayer.playAlarm(asAlarm: true);
      createAlarmNotification("FOCUS", 0);

      new Timer(Duration(seconds: 5), () { FlutterRingtonePlayer.stop();});
        print("Hola");

        currentPhase = "BREAK";
        currentDuration = selectedTimePrev * (300/1500);
        selectedTime = selectedTimePrev;
        rounds++;

        if(rounds == 4){
          FlutterRingtonePlayer.playAlarm();
          createAlarmNotification("FOCUS", 2);

          new Timer(Duration(seconds: 5), () { FlutterRingtonePlayer.stop();});

          currentPhase = "LONGBREAK";
          currentDuration = selectedTimePrev;
          selectedTime = selectedTimePrev;
        }

    }
    else if(currentPhase == "BREAK")
    {
      FlutterRingtonePlayer.playAlarm();
      createAlarmNotification("BREAK", 1);

      new Timer(Duration(seconds: 5), () { FlutterRingtonePlayer.stop();});

        currentPhase = "FOCUS";
      currentDuration = selectedTimePrev;
      selectedTime = selectedTimePrev;

        print(rounds);
    }
    else if(currentPhase == "LONGBREAK")
    {
      FlutterRingtonePlayer.playAlarm();
      createAlarmNotification("LONGBREAK", 3);

      new Timer(Duration(seconds: 5), () { FlutterRingtonePlayer.stop();});


        currentPhase = "FOCUS";
        currentDuration = selectedTimePrev;
        selectedTime = selectedTimePrev;
        rounds = 0;
        goal++;
        if(goal == maxGoals){
          goal = 0;
          timer.cancel();
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => FinishScene()
              )
          );
        }
    }

    notifyListeners();
  }

  Future<void> createAlarmNotification(String text, int id) async{
    await AwesomeNotifications().createNotification(
        content: NotificationContent(
            id: id,
            channelKey: 'basic_channel',
            title: 'Alarm',
            body: 'Finish ${text} time',
            autoDismissible: false
        ),
        actionButtons: [
          NotificationActionButton(key: 'close', label: 'Stop')
        ]
    );
  }
}