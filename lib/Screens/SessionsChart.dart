
import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practica2dm/Tools/SessionData.dart';
import 'package:practica2dm/Tools/utils.dart';
import 'package:provider/provider.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class SessionsChart extends StatefulWidget{
  @override
  _SessionsChartState createState() => _SessionsChartState();
}

class BarData
{
  final String fecha;
  final double tiempo;

  BarData(this.fecha, this.tiempo);
}

class _SessionsChartState extends State<SessionsChart>{

  late SessionDatabase database;



  void cargarDatos(SessionDatabase database, List<SessionDataData> datitos) async{

    final data = getSessionDFromDatabase(database);
    await data.then((value){
      for(SessionDataData item in value){
        datitos.add(item);
      }
    });


    _createBarChart(datitos);
    print(datitos.length);

  }
  List<charts.Series<BarData, String>> _createBarChart(List<SessionDataData> datos)
  {

    List<BarData> datosBar =[];

    for(SessionDataData item in datos){
      datosBar.add(BarData(item.fecha.toString(), item.tiempo));

    }

    return [
      charts.Series<BarData,String>(
        data: datosBar,
        id: "cosas",
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (BarData barModel, _) => barModel.fecha,
        measureFn: (BarData barModel,_) => barModel.tiempo

      )
    ];
  }



  @override
  Widget build(BuildContext context){
    database = Provider.of<SessionDatabase>(context);
    List<SessionDataData> datos = [];

    var chart = charts.BarChart(
        _createBarChart(datos),
        animate: false
    );

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
          IconButton(
              onPressed: ()=>cargarDatos(database, datos),
              icon: Icon(Icons.more_vert, color: Colors.white),
              iconSize: 40)
        ],
      ),
      body: Center(
        child: Container(
          height: 300,
          child: Column(
            children: [
              ElevatedButton(onPressed: ()=>cargarDatos(database, datos), child: Text("Load data", style: textStyle(35,honeyYellow(),FontWeight.w500),))
            ],
          )
        ),
      ),
    );
  }

  Future<List<SessionDataData>> getSessionDFromDatabase(SessionDatabase database) async{
    return await database.getSessionList();
  }

  void getListaData(List<SessionDataData> data, SessionDatabase database) async
  {
      final lista = getSessionDFromDatabase(database);
      await lista.then((value){
        for(SessionDataData item in value){
          data.add(item);
        }
      });
      print(data.length);
  }
}

