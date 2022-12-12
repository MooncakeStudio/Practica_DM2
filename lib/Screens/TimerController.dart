
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practica2dm/Tools/TimerData.dart';
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
      width: 100,
      height: 100,
      decoration: BoxDecoration(color: Colors.black26, shape: BoxShape.circle),
      child: Center(
        child: IconButton(
          icon: provider.isTimerPlaying ? Icon(Icons.pause) : Icon(Icons.play_arrow),
          color: Colors.white,
          iconSize: 55,
          onPressed: ()
          {
            provider.isTimerPlaying ? Provider.of<TimerData>(context, listen: false).pauseSession() : Provider.of<TimerData>(context, listen: false).startSession(context);
          },
        )
      )
    );
  }
}