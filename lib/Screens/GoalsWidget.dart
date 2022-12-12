import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practica2dm/Tools/TimerData.dart';
import 'package:practica2dm/Tools/utils.dart';
import 'package:provider/provider.dart';

class GoalsWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    final provider = Provider.of<TimerData>(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("${provider.rounds}/4", style: textStyle(30, Colors.grey[200], FontWeight.bold),),
            Text("${provider.goal}/${provider.maxGoals}", style: textStyle(30, Colors.grey[200], FontWeight.bold),),
          ],
        ),
        SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("ROUND", style: textStyle(25,Colors.grey[200], FontWeight.bold),),
            Text("GOAL", style: textStyle(25,Colors.grey[200], FontWeight.bold),),
          ],
        )
      ],
    );
  }
}