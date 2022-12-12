import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practica2dm/Screens/Credits.dart';
import 'package:practica2dm/Screens/MainMenu.dart';
import 'package:practica2dm/Tools/utils.dart';

class FinishScene extends StatelessWidget{
  @override
  Widget build(BuildContext context){
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
        body: Center(
            child: Container(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 10,),
                    Text("Congratulations!!!",style:textStyle(35, textoBotones(), FontWeight.w500)),
                    SizedBox(height: 10,),
                    Text("You did it",style:textStyle(35, textoBotones(), FontWeight.w500)),
                    SizedBox(height: 40,),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: botones()
                        ),
                        onPressed: () {
                          AudioPlayer().play(AssetSource('PulsarBoton.wav'));
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MainMenu()));
                        },
                        child: Text("MENU",
                            style:
                            textStyle(34, textoBotones(), FontWeight.w500))),
                    SizedBox(height: 17.2,),
                    Image.asset('assets/Raley2.png'),
                  ]
                )
            )
        )
    );
  }
}