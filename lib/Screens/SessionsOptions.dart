import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practica2dm/Tools/TimerData.dart';
import 'package:practica2dm/Tools/utils.dart';
import 'package:provider/provider.dart';

class SessionsOptions extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    final provider = Provider.of<TimerData>(context);
    return SingleChildScrollView(
      controller: ScrollController(initialScrollOffset: 160),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: numberSessions.map((time){
          return InkWell(
            onTap: ()
            {
              provider.selectMaxGoals(int.parse(time));
            },
            child: Container(
              margin: EdgeInsets.only(left:10),
              width: 70,
              height: 50,
              decoration: int.parse(time) == provider.maxGoals ? BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5)
              ): BoxDecoration(
                border: Border.all(width: 3, color: Colors.white30),
                borderRadius: BorderRadius.circular(5)
              ),
              child: Center(
                child: Text(
                  (int.parse(time)).toString(),
                  style: textStyle(25, int.parse(time) == provider.maxGoals ? honeyYellow(): Colors.white, FontWeight.w700),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}