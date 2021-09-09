import 'package:flutter/material.dart';

import 'constants/constants.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text("Dark Theme",style: TextStyle(fontSize: 18,color: colorWetAsphalt,fontWeight: FontWeight.bold),),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
