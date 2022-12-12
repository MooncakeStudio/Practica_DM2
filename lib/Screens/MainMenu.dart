import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practica2dm/Screens/SelectorTime.dart';
import 'package:practica2dm/Screens/SessionsChart.dart';
import 'package:practica2dm/Tools/SessionData.dart';
import 'package:practica2dm/Tools/utils.dart';
import 'package:provider/provider.dart';

class MainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => SessionDatabase(),
      child: Scaffold(
        backgroundColor: Colors.deepPurpleAccent,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.lightGreen,
          title: Text(
            "MOONCAKE'S POMODORO",
            style: textStyle(20, Colors.white, FontWeight.w700),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(Icons.more_vert, color: Colors.white),
                iconSize: 40)
          ],
        ),
        body: Center(
          child: Container(
              alignment: Alignment.center,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //Image(image: "", fit: BoxFit.fill),
                    Text(
                      "Aqui va la imagen",
                      style: textStyle(70, Colors.black, FontWeight.w700),
                    ),
                    SizedBox(height: 20),
                    Text("POMODORO",
                        style: textStyle(50, honeyYellow(), FontWeight.w700)),
                    SizedBox(height: 40),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SelectorTime()));
                        },
                        child: Text("TIMER",
                            style:
                                textStyle(34, honeyYellow(), FontWeight.w500))),
                    SizedBox(height: 40),
                    ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          "TIMEY",
                          style: textStyle(34, honeyYellow(), FontWeight.w500),
                        )),
                    SizedBox(height: 40,),
                    ElevatedButton(
                        onPressed: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SessionsChart()));
                        },
                        child: Text(
                          "STATS",
                          style: textStyle(34, honeyYellow(), FontWeight.w500)
                        )
                    )
                  ])),
        ),
      ),
    );
  }
}
