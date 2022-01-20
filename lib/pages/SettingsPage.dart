import'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Colors.lightBlue.shade700,

      appBar: new AppBar(
          backgroundColor: Colors.lightBlue.shade900,
          toolbarHeight: 65,
          title: new Text("SETTINGS PAGE")
      ),

      body: new Center(
          child: new Text("This is the settings page")
      ),

    );
  }
}
