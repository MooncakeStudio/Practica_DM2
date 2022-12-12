

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:practica2dm/Screens/GoalsWidget.dart';
import 'package:practica2dm/Screens/TimerController.dart';
import 'package:practica2dm/Tools/TimerData.dart';
import 'package:practica2dm/Tools/utils.dart';
import 'package:provider/provider.dart';

class Session extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    final provider = Provider.of<TimerData>(context);
    final seconds = provider.currentDuration % 60;
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.lightGreen,
        title: Text(
          "MOONCAKE'S POMODORO",
          style: textStyle(20, Colors.white, FontWeight.w700),
        ),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.more_vert, color: Colors.white), iconSize: 40)
        ],
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 18),
              child: Text(
                provider.currentPhase,
                style: textStyle(35,honeyYellow(),FontWeight.w700),
              ) 
            ),
            CircularPercentIndicator(
                circularStrokeCap: CircularStrokeCap.round,
                percent: provider.currentDuration / provider.selectedTime,
                animation: true,
                animateFromLastPercent: true,
                radius: 175,
                lineWidth: 20,
                progressColor: Colors.amberAccent,
                center: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            width: 100,
                            height: 125,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.blueGrey.withOpacity(0.5),
                                      spreadRadius: 4,
                                      blurRadius: 4,
                                      offset: Offset(0,2)
                                  )
                                ]),
                            child: Center(
                                child: Text((provider.currentDuration ~/ 60).toString(), style: textStyle(50,honeyYellow(),FontWeight.bold),)
                            )
                        ),
                        SizedBox(width: 10,),
                        Text(":",style: textStyle(60,Colors.green[200],FontWeight.bold),),
                        SizedBox(width: 10,),
                        Container(
                            width: 100,
                            height: 125,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.blueGrey.withOpacity(0.5),
                                      spreadRadius: 4,
                                      blurRadius: 4,
                                      offset: Offset(0,2)
                                  )
                                ]),
                            child: Center(
                                child: Text(seconds < 10 ? "0${seconds.round()}" : seconds.round().toString(), style: textStyle(50
                                    ,honeyYellow(),FontWeight.bold),)
                            )
                        ),
                      ]
                  )
            ),
            SizedBox(height: 25,),
            TimerController(),
            SizedBox(height: 25,),
            GoalsWidget()
          ],
        ),
      ),
    );
  }
}