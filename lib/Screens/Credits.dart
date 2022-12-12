import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practica2dm/Screens/MainMenu.dart';
import 'package:practica2dm/Tools/utils.dart';

class Credits extends StatelessWidget{
  @override
  Widget build (BuildContext context){
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
                  onTap: () {}
                )
              ],
            )
        ),
        body: Center(
            child: Container(
                alignment: Alignment.center,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 10,),
                      Text("CREATED BY:", style: textStyle(45,textoNormal(),FontWeight.bold)),
                      SizedBox(height: 25),
                      Image.asset('assets/MooncakeStudio.png'),
                      Text("Pablo Álvarez de Lara Fernández\nDaniel Mayoral Fernández-Baíllo\nJavier Picado Hijón\nMarta Rodríguez Castillo\n",
                          style: textStyle(15,textoNormal(),FontWeight.w600)),
                      SizedBox(height: 20,),
                      Text("SOUND BY:", style: textStyle(15,textoNormal(),FontWeight.w400)),
                      Text("https://mixkit.co/", style: textStyle(10,textoNormal(),FontWeight.w300)),

                    ]
                )
            )
        )
    );
  }
}