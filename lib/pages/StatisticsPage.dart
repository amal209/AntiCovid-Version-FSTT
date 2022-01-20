

import 'dart:convert' as convert;
//import 'package:fcm_http/helper.dart';
import 'package:db_qr_code/Statistics/fcm_manager.dart';
import 'package:db_qr_code/Statistics/helper.dart';
import 'package:http/http.dart' as http;

import 'package:db_qr_code/constants.dart';
import 'package:db_qr_code/widgets/header.dart';

//import 'package:fcm_http/fcm_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
//import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class MyStatisticsPage extends StatefulWidget {
  const MyStatisticsPage({Key? key, required this.title, }) : super(key: key);
  final String title;


  @override
  State<MyStatisticsPage> createState() => _MyStatisticsPageState();
}

class _MyStatisticsPageState extends State<MyStatisticsPage> {
  Map<String, dynamic> data = Map<String, dynamic>();

  Future<void> _sendData() async {
    showLoader(context);
    var url = Uri.parse(
        'https://corona.lmao.ninja/v2/countries/Morocco?yesterday=false&strict=true&query =');

    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    if (response.statusCode == 200) {
      setState(() {
        this.data = convert.jsonDecode(response.body) as Map<String, dynamic>;
      });
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
    hideLoader(context);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FcmManager fcm = FcmManager();
    fcm.initFCM();
    this.initData();
  }

  buildHome() {
    return Column(
      children: [
        Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 2,
              padding: const EdgeInsets.all(18.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    children: [
                      Text(
                          "Total cases",
                          style: KTitleTextStyle,
                      ),
                      SizedBox(
                        height: 18.0,
                      ),
                      Text(
                          data['cases'].toString())
                    ],
                  ),
                ),
                elevation: 10,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 2,
              padding: const EdgeInsets.all(18.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    children: [
                      Text(
                          "Today's cases",
                           style: KTitleTextStyle,
                      ),
                      SizedBox(
                        height: 18.0,
                      ),
                      Text(data['todayCases'].toString())
                    ],
                  ),
                ),
                elevation: 10,
              ),
            )
          ],
        ),
        Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 2,
              padding: const EdgeInsets.all(18.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    children: [
                      Text(
                          "Total deaths",
                        style: KTitleTextStyle,
                      ),

                      const SizedBox(
                        height: 18.0,
                        //child: const ColoredBox(color: Colors.amber),
                      ),
                      Text(
                          data['deaths'].toString()
                      )
                    ],
                  ),
                ),
                elevation: 10,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 2,
              padding: const EdgeInsets.all(18.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    children: [
                      Text(
                          "Today's deaths",
                           style: KTitleTextStyle
                      ),
                      SizedBox(
                        height: 18.0,
                      ),
                      Text(data['todayDeaths'].toString())
                    ],
                  ),
                ),
                elevation: 10,
              ),
            )
          ],
        ),
        Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 2,
              padding: const EdgeInsets.all(18.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    children: [
                      Text(
                          "Total recovered",
                          style: KTitleTextStyle),
                      SizedBox(
                        height: 18.0,
                      ),
                      Text(data['recovered'].toString())
                    ],
                  ),
                ),
                elevation: 10,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 2,
              padding: const EdgeInsets.all(18.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    children: [
                      Text(
                          "Today's recovered",
                          style: KTitleTextStyle),
                      SizedBox(
                        height: 18.0,
                      ),
                      Text(data['todayRecovered'].toString())
                    ],
                  ),
                ),
                elevation: 10,
              ),
            )
          ],
        ),
        Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 2,
              padding: const EdgeInsets.all(18.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    children: [
                      Text(
                          "Total tests",
                          style: KTitleTextStyle),
                      SizedBox(
                        height: 18.0,
                      ),
                      Text(data['tests'].toString())
                    ],
                  ),
                ),
                elevation: 10,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 2,
              padding: const EdgeInsets.all(18.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    children: [
                      Text(
                        "Tests / million",
                        textAlign: TextAlign.center,
                          style: KTitleTextStyle
                      ),
                      SizedBox(
                        height: 18.0,
                      ),
                      Text(data['testsPerOneMillion'].toString())
                    ],
                  ),
                ),
                elevation: 10,
              ),
            )
          ],
        )
      ],
    );
  }

  initData() async {
    var url = Uri.parse(
        'https://corona.lmao.ninja/v2/countries/Morocco?yesterday=false&strict=true&query =');

    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    if (response.statusCode == 200) {
      setState(() {
        this.data = convert.jsonDecode(response.body) as Map<String, dynamic>;
      });
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.lightBlue.shade700,

      appBar: AppBar(
        backgroundColor: Colors.lightBlue.shade900,
        toolbarHeight: 65,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(
            widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: data.length > 0 ? buildHome() : CircularProgressIndicator(),
      ),
      floatingActionButton:
      FloatingActionButton(
        backgroundColor: Colors.black87,
        onPressed: _sendData,
        tooltip: 'refresh',
        child: const Icon(
            Icons.refresh,
            color: Colors.white,
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}





