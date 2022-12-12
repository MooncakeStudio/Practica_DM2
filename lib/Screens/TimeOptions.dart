
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practica2dm/Tools/utils.dart';
import 'package:practica2dm/Tools/TimerData.dart';
import 'package:provider/provider.dart';

class TimeOptions extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    final provider = Provider.of<TimerData>(context);
    return SingleChildScrollView(
      controller: ScrollController(initialScrollOffset: 160),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: timesOptions.map((time){
          return InkWell(
            onTap: ()=>provider.selectTime(10),
            child: Container(
              margin: EdgeInsets.only(left:10),
              width: 70,
              height: 50,
              decoration: int.parse(time) == provider.selectedTime ?
              BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5)
              ) : BoxDecoration(
                  border: Border.all(width: 3, color: Colors.white),
                  borderRadius: BorderRadius.circular(5)
              ),
              child: Center(
                child: Text(
                  (int.parse(time) ~/ 60).toString(),
                  style: textStyle(25, int.parse(time) == provider.selectedTime ? honeyYellow() : Colors.white, FontWeight.w700),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}