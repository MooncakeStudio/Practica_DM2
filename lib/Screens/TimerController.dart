
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practica2dm/Tools/TimerData.dart';
import 'package:practica2dm/Tools/utils.dart';
import 'package:provider/provider.dart';

class TimerController extends StatefulWidget{
  @override
  _TimerControllerState createState() => _TimerControllerState();
}

class _TimerControllerState extends State<TimerController>{
  @override
  Widget build(BuildContext context){
    final provider = Provider.of<TimerData>(context);
    return Container(
      width: 150,
      height: 80,
      child: Center(
        child: provider.isTimerPlaying ? ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: botones()
            ),
            onPressed: (){
              AudioPlayer().play(AssetSource('PulsarBoton.wav'));
              Provider.of<TimerData>(context, listen: false).pauseSession();
            },
            child: Text(
              "PAUSE",
              style: textStyle(15, textoNormal(), FontWeight.w500),
            )
        ) : ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: botones()
            ),
            onPressed: (){
              AudioPlayer().play(AssetSource('PulsarBoton.wav'));
              Provider.of<TimerData>(context, listen: false).startSession(context);
            },
            child: Text(
              "START",
              style: textStyle(15, textoNormal(), FontWeight.w500),
            )
        )

        )
    );
  }
}