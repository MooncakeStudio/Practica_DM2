import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practica2dm/Screens/Session.dart';
import 'package:practica2dm/Screens/SessionsOptions.dart';
import 'package:practica2dm/Screens/TimeOptions.dart';
import 'package:practica2dm/Tools/TimerData.dart';
import 'package:practica2dm/Tools/utils.dart';
import 'package:provider/provider.dart';

class SelectorTime extends StatelessWidget{
  @override
  Widget build(BuildContext context){
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

      body: Center(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "SELECT YOUR FOUCS TIME",
                style: textStyle(45, honeyYellow(), FontWeight.w700),
              ),
              SizedBox(height: 40,),
              TimeOptions(),
              SizedBox(height: 40,),
              Text(
                "SESSION'S NUMBER",
                style: textStyle(35, honeyYellow(), FontWeight.w700),
              ),
              SizedBox(height: 40,),
              SessionsOptions(),
              SizedBox(height: 40,),
              ElevatedButton(
                  onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Session())
                    );
                  },
                  child: Text(
                    "START SESSION",
                    style: textStyle(15, honeyYellow(), FontWeight.w500),
                  )
              )
            ],
          )
        )
      )
    );
  }
}