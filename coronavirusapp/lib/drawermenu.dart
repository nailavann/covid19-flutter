import 'package:coronavirusapp/constants/constants.dart';
import 'package:coronavirusapp/country/countrypage.dart';
import 'package:coronavirusapp/main.dart';
import 'package:coronavirusapp/settingspage.dart';
import 'package:flutter/material.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: ListView(
          children: [
            InkWell(
              onTap: () => Navigator.push(context,MaterialPageRoute(builder: (context) => MyHomePage(),)),
              child: DrawerGenerated(
                text: "Home",
                icons: Icon(Icons.home),
              ),
            ),
            InkWell(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => CountryPage(),)),
              child: DrawerGenerated(
                text: "Country Details",
                icons: Icon(Icons.coronavirus),
              ),
            ),
            InkWell(
              child: DrawerGenerated(
                text: "Info",
                icons: Icon(Icons.info),
              ),
            ),
            InkWell(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsPage(),)),
              child: DrawerGenerated(
                text: "Settings",
                icons: Icon(Icons.settings),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerGenerated extends StatelessWidget {
  final String text;
  final Icon icons;

  const DrawerGenerated({Key? key, required this.text, required this.icons})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            child: InkWell(
              child: ListTile(
                title: Text(text),
                leading: icons,
              ),
            ),
          ),
          Divider(),
        ],
      ),
    );
  }
}