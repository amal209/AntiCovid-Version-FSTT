import 'package:db_qr_code/details.dart';
import 'package:db_qr_code/pages/StatisticsPage.dart';
import 'package:flutter/material.dart';
import 'package:db_qr_code/constants.dart';
import 'package:db_qr_code/widgets/header.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class InfoScreen extends StatefulWidget {
  static const routeName = 'info_screen';

  @override
  _InfoScreenState createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  ScrollController scrollController = ScrollController();
  double offset = 0;
  Map<String, dynamic> data = Map<String, dynamic>();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(onScroll);
    this.initData();
  }

  onScroll() {
    setState(() {
      offset = scrollController.hasClients ? scrollController.offset : 0;
    });
  }
  void _back(BuildContext context) {
    final route=MaterialPageRoute(builder: (BuildContext context){
      return Details();
      //return MyBottomNavigationBar();

    });
    Navigator.of(context).push(route);
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
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

  void _MyStatistic(BuildContext context) {
    final route=MaterialPageRoute(builder: (BuildContext context){
      return MyStatisticsPage(title:"STATISTICS");

    });
    Navigator.of(context).push(route);
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue.shade700,

      //backgroundColor: Colors.yellow.shade800,
      body: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            MyHeader(
              offset: offset,
              image: 'assets/icons/amal.svg',
              textBottom: 'About Covid-19',
              textTop: 'Get to Know more', key: null,
            ),



            // STATIIIIIII

            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Text(
                    "General Statistics",
                    style: myStyle,
                  ),
            ],
              ),
            ),

            SizedBox(height: 5),
            InkWell(
              onTap: () {
                _back(context);
              },
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.lightBlue.shade900,
                      Colors.lightBlue.shade900,
                    ],
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "TAP HERE FOR MORE STATISTICS",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),


                  ],
                ),
              ),
            ),

            SizedBox(height: 5),
            InkWell(
              onTap: () {
                _MyStatistic(context);
              },
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.lightBlue.shade900,
                      Colors.lightBlue.shade900,
                    ],
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "TOTAL CASES",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),

                    SizedBox(height: 5),
                    Text(
                      data['cases'].toString(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 8),
            InkWell(
              onTap: () {
                _MyStatistic(context);
              },
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.lightBlue.shade900,
                      Colors.lightBlue.shade900,
                    ],
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "TOTAL DEATHS",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),

                    SizedBox(height: 5),
                    Text(
                      data['deaths'].toString(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),



            //SYMPTOMS
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Symptoms',
                    style: myStyle,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        SymptomCard(
                          image: "assets/images/caugh.png",

                          title: 'Caugh',
                        ),
                        SymptomCard(
                          image: 'assets/images/fever.png',
                          title: 'Fever',
                        ),
                        SymptomCard(
                          image: 'assets/images/Shortness_breath.png',
                          title: 'Difficulty breathing',
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),


        //PREVENTION

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Prevention',
                    style: myStyle,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  PreventionCard(
                    image: 'assets/images/wear_mask.png',
                    title: 'Wear face mask',
                    text:
                        'Everyone 2 years or older who is not fully vaccinated should wear a mask in indoor and outdoor public places.',
                  ),
                  PreventionCard(
                    image: 'assets/images/wash_hands.png',
                    title: 'Wash your hands',
                    text:
                        'Wash your hands often with soap and water for at least 20 seconds especially after you have been in a public place, or after blowing your nose, coughing, or sneezing.',
                  ),

                  PreventionCard(
                    image: 'assets/images/stay_away.png',
                    title: 'Stay 6 feet away from others',
                    text:
                    '- Inside your home: Avoid close contact with people who are sick.\n- Outside your home: Remember that some people without symptoms may be able to spread virus.',
                  ),

                  PreventionCard(
                    image: 'assets/images/get_vaccinated.png',
                    title: 'Get Vaccinated',
                    text:
                    '- Authorized COVID-19 vaccines can help protect you from COVID-19.\n- You should get a COVID-19 vaccine as soon as you can so you can be able to start doing some things that you had stopped doing because of the pandemic.\n'
                  ),

                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

class SymptomCard extends StatelessWidget {
  final String image;
  final String title;
  SymptomCard({required this.image, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 120,
      padding: const EdgeInsets.all(5.0),
      margin: const EdgeInsets.only(right: 17.0, bottom: 20),
      decoration:
          KCardDecoration.copyWith(borderRadius: BorderRadius.circular(15.0)),
      child: Column(
        children: <Widget>[
          Expanded(child: Image.asset(image)),
          Text(
            '$title',
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}

class PreventionCard extends StatelessWidget {
  final String image;
  final String title;
  final String text;

  PreventionCard({required this.image,required this.title, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30.0),
      child: Stack(
        alignment: Alignment.centerLeft,
        overflow: Overflow.visible,
        children: <Widget>[
          Container(
            height: 150,
            width: double.infinity,
            margin: const EdgeInsets.only(left: 10.0),
            padding: const EdgeInsets.fromLTRB(165.0, 20.0, 20.0, 15),
            decoration: KCardDecoration.copyWith(
                borderRadius: BorderRadius.circular(15.0)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  style: KTitleTextStyle.copyWith(fontSize: 16),
                ),
                SizedBox(
                  height: 8,
                ),
                Expanded(
                  child: Text(
                    text,
                    textAlign: TextAlign.justify,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 20,
                    style: KTitleTextStyle.copyWith(fontSize: 11),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  //child: SvgPicture.asset('assets/icons/forward.svg'),
                ),
              ],
            ),
          ),
          Positioned(
            left: 10,
            child: Image.asset(
              image,
              height: 130,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
