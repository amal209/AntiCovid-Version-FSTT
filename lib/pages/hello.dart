import 'package:db_qr_code/Statistics/firebase_config.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_udid/flutter_udid.dart';
import 'package:uuid/uuid.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

import '../devices_list_screen2.dart';
import '../main.dart';


class HelloPage extends StatefulWidget {
  const HelloPage({Key? key}) : super(key: key);

  @override
  _HelloPageState createState() => _HelloPageState();
}


Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp`
  // using other Firebase services.
  await Firebase.initializeApp(options: DefaultFirebaseConfig.platformOptions);
  print('Handling a background message ${message.messageId}');
}
class _HelloPageState extends State<HelloPage> {

  //String myToken;

  //FirebaseMessaging.instance.getToken().then((value) => {myToken=value?});



  initFCM() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseConfig.platformOptions,
    );

    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
    FirebaseMessaging.instance
        .getInitialMessage()
        .then((RemoteMessage? message) {
      print(message);
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      print(message);
    });
    FirebaseMessaging.instance.getToken().then((value) => {_sendData(value)});



    FirebaseMessaging.instance.getToken().then((value)=>print(value));
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('A new onMessageOpenedApp event was published!');
    });
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }



  Future<void> _sendData(token) async {
    var client = http.Client();
    String udid;
    try {
      udid = await FlutterUdid.consistentUdid;
    } on PlatformException {
      var uuid = Uuid();
      udid = uuid.v1();
    }
    try {
      var response = await client.post(
          Uri.parse('http://192.168.11.104:8000/api/v1/devices'),
          //Uri.parse('http://127.0.0.1:8000/api/v1/devices'),


          body: {'token': token, 'udid': udid});
      var decodedResponse =
      convert.jsonDecode(convert.utf8.decode(response.bodyBytes)) as Map;
      var key = decodedResponse['key'] as String;
      _back(context);
    } finally {
      client.close();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        leading: IconButton(onPressed:(){_back(context);}, icon: Icon(Icons.arrow_back)),
        backgroundColor: Colors.teal,
        elevation: 0,
        title: Text(
          "Detection",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      // plusieurs elements horizontaux
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 35,horizontal: 15),
          child: Center(
            child: Column(
              children: <Widget>[
                Image.asset('assets/images/blue.png'),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Activate Bluetooth",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "To use this application, you should activate your Bluetooth. NB!!! We don't store any personal information",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                      //width: double.infinity,
                      //color: Colors.tealAccent,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Stack(
                            children: <Widget>[
                              Positioned.fill(
                                child: Container(
                                  decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: <Color>[
                                        Color(0xFF0D47A1),
                                        Color(0xFF1976D2),
                                        Color(0xFF42A5F5),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                    padding: const EdgeInsets.all(8.0),
                                    primary: Colors.white,
                                    textStyle: const TextStyle(fontSize: 20),
                                  ),
                                  onPressed: () {
                                    FirebaseMessaging.instance.getToken().then((value) => {_sendData(value)});
                                    _back(context);

                                  },

                                  child: const Text('Activate Bluetooth'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }

/*
  @override
  Widget build(BuildContext context) {
    return new Scaffold(


      body: Center(

        child: ElevatedButton(

          child: const Text('Activer Bluetooth'),
          onPressed: () {
            //_register();
            FirebaseMessaging.instance.getToken().then((value) => {_sendData(value)});
            _back(context);
          },
        ),
      ),

    );
  }
*/

  void _back(BuildContext context) {
    final route=MaterialPageRoute(builder: (BuildContext context){
      return DevicesListScreen();
      //return MyBottomNavigationBar();

    });
    Navigator.of(context).push(route);
  }


}
