

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:practica2dm/Screens/Credits.dart';
import 'package:practica2dm/Screens/GoalsWidget.dart';
import 'package:practica2dm/Screens/MainMenu.dart';
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
      backgroundColor: fondo(),
      appBar: AppBar(
          elevation: 0,
          backgroundColor: barraSuperior(),
          title: Text(
            "MOONCAKE ESTUDIO",
            style: textStyle(20, textoNormal(), FontWeight.w700),
          )
      ),
      drawer: Drawer(
          backgroundColor: fondo(),
          child: ListView(
            padding: EdgeInsets.only(top: 45, left: 15),
            children: [
              Text("MOONCAKE ESTUDIO", style: textStyle(35, textoNormal(), FontWeight.w700)),
              ListTile(
                  leading: Icon(Icons.home),
                  title:  Text('HOME', style: textStyle(15, textoBotones(), FontWeight.w700)),
                  onTap: () {
                    AudioPlayer().play(AssetSource('PulsarBoton.wav'));
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MainMenu())
                  );
                  }
              ),
              ListTile(
                  leading: Icon(Icons.account_circle),
                  title: Text('CONTACT',style: textStyle(15, textoBotones(), FontWeight.w700)),
                  onTap: () {
                    AudioPlayer().play(AssetSource('PulsarBoton.wav'));
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Credits())
                  );
                  }
              )
            ],
          )
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 15),
              child: Text(
                provider.currentPhase,
                style: textStyle(35,textoNormal(),FontWeight.w700),
              ) 
            ),
            CircularPercentIndicator(
                circularStrokeCap: CircularStrokeCap.round,
                percent: provider.currentDuration / provider.selectedTime,
                animation: true,
                animateFromLastPercent: true,
                radius: 175,
                lineWidth: 20,
                progressColor: circuloCronometro(),
                center: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 50,),
                        Row(
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
                                    child: Text((provider.currentDuration ~/ 60).toString(), style: textStyle(50,textoNormal(),FontWeight.bold),)
                                )
                            ),
                            SizedBox(width: 10,),
                            Text(":",style: textStyle(60,textoNormal(),FontWeight.bold),),
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
                                        ,textoNormal(),FontWeight.bold),)
                                )
                            ),
                          ],
                        ),
                        TimerController()
                      ]
                  ),
            ),

            Expanded(child: Image.asset('assets/AnimGIF2.gif')),
            SizedBox(height: 15,),
            GoalsWidget(),
            SizedBox(height: 25,),
          ],
        ),
      ),
    );
  }
}