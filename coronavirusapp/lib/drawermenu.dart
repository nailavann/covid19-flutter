import 'package:coronavirusapp/country/countrypage.dart';
import 'package:coronavirusapp/main.dart';
import 'package:coronavirusapp/piechartpage.dart';
import 'package:flutter/material.dart';

import 'infopage.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: ListView(
          children: [
            InkWell(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyHomePage(),
                  )),
              child: DrawerGenerated(
                text: "Home",
                icons: Icon(Icons.home),
              ),
            ),
            InkWell(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CountryPage(),
                  )),
              child: DrawerGenerated(
                text: "Country ",
                icons: Icon(Icons.coronavirus),
              ),
            ),
            InkWell(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PieChartPage(),
                  )),
              child: DrawerGenerated(
                text: "Pie Chart ",
                icons: Icon(Icons.pie_chart),
              ),
            ),
            InkWell(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => InfoPage(),
                  )),
              child: DrawerGenerated(
                text: "Info",
                icons: Icon(Icons.info),
              ),
            )
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
