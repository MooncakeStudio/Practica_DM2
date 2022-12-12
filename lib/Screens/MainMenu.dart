import 'package:audioplayers/audioplayers.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practica2dm/Screens/Credits.dart';
import 'package:practica2dm/Screens/SelectorTime.dart';
import 'package:practica2dm/Screens/SessionsChart.dart';
import 'package:practica2dm/Tools/SessionData.dart';
import 'package:practica2dm/Tools/utils.dart';
import 'package:provider/provider.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';

class MainMenu extends StatefulWidget{
  const MainMenu({Key? key}) : super(key: key);

  @override
  _MainMenuState createState() => _MainMenuState();
}
class _MainMenuState extends State<MainMenu> {

  static Future<void> stopAlarm (ReceivedAction action) async{
    if(action.buttonKeyPressed == "close"){
      FlutterRingtonePlayer.stop();
    }
  }



  @override
  void initState(){
    super.initState();
    AwesomeNotifications().isNotificationAllowed().then((isAllowed){
      if(!isAllowed) {
        showDialog(
            context: context,
            builder: (context) =>
                AlertDialog(
                    title: Text('Allow Notifications'),
                    content: Text(
                        'The app need permissions to send you notifications'),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                              "Don\'t allow",
                              style: textStyle(
                                  25, textoBotones(), FontWeight.w500)
                          )
                      ),
                      TextButton(
                          onPressed: () =>
                              AwesomeNotifications().requestPermissionToSendNotifications().then((_)=> Navigator.pop(context)),
                          child: Text(
                              "Allow",
                              style: textStyle(
                                  25, textoBotones(), FontWeight.w500)
                          )
                      ),
                    ]
                )
        );
      }
    });

    AwesomeNotifications().setListeners(onActionReceivedMethod: stopAlarm);
  }

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => SessionDatabase(),
      child: Scaffold(
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
                    Image.asset('assets/icono_Disp_Moviles_transparente.png'),
                    SizedBox(height: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: botones()
                      ),
                        onPressed: () {
                          AudioPlayer().play(AssetSource('PulsarBoton.wav'));
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SelectorTime()));
                        },
                        child: Text("START",
                            style:
                                textStyle(34, textoBotones(), FontWeight.w500))),
                    SizedBox(height: 40,)
                  ])),
        ),
      ),
    );
  }
}
