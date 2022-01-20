import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:db_qr_code/QR%20code/details_display_screen.dart';
import 'package:db_qr_code/QR code/intances.dart';
import 'package:db_qr_code/Statistics/fcm_manager.dart';


import 'package:db_qr_code/pages/SettingsPage.dart';
import 'package:db_qr_code/pages/StatisticsPage.dart';
import 'package:db_qr_code/pages/WalletPage.dart';
import 'package:db_qr_code/QR code/qr_code.dart';
import 'package:db_qr_code/QR%20code/qr_code_screen.dart';
import 'package:db_qr_code/pages/hello.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_udid/flutter_udid.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:uuid/uuid.dart';


import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:flutter_udid/flutter_udid.dart';
import 'package:uuid/uuid.dart';

//import 'firebase_config.dart';


import 'Statistics/firebase_config.dart';
import 'pages/info_screen.dart';
import 'package:http/http.dart' as http;

Future main() async{

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  runApp(
      MyApp()
  );
}

class MyApp extends StatelessWidget {
  //const ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      //home: MyBottomNavigationBar(),
      home: HelloPage(),
    );
  }
}

// GET TOKEN




//Creating Navigation bar
class MyBottomNavigationBar extends StatefulWidget {
  const MyBottomNavigationBar({Key? key}) : super(key: key);


  @override
  _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
}


class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {





  @override
  void initState() {

    FirebaseMessaging.instance.getToken().then((value) => print('VALEUR ${value}'));

    /*
    // TODO: implement initState
    super.initState();
    FcmManager fcm = FcmManager();
    fcm.initFCM();
    //this.initData();*/
  }


  int _currentIndex=0;
  final List<Widget> _children =[
    InfoScreen(), // Home page
    MyStatisticsPage(title:"STATISTICS"),
    MyWalletPage(title: "WALLET"),
    SettingsPage(),
  ];

  void onTappedBar(int index){
    setState(() {
      _currentIndex = index;
    });
  }



  @override
  Widget build(BuildContext context) {

    final items = <Widget>[
      Icon(Icons.home,size:30),
      Icon(Icons.bar_chart,size:30),
      Icon(Icons.featured_play_list,size:30),
      Icon(Icons.settings,size:30),
    ];
    return Scaffold(
      //extendBody: true,
      body: _children[_currentIndex],


      bottomNavigationBar: CurvedNavigationBar(
        //backgroundColor: Colors.transparent,
        backgroundColor: Colors.lightBlue.shade700,
        items: items,
        height: 60,


        onTap: onTappedBar,

        //currentIndex: _currentIndex,

      ),
    );
  }


}
