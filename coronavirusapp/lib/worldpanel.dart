import 'package:coronavirusapp/constants/constants.dart';
import 'package:flutter/material.dart';

class WorldPanel extends StatelessWidget {
  final Map? worldData;

  const WorldPanel({Key? key, required this.worldData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView(
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 2),
        children: [
          StatusPanel(
              title: 'Today Cases',
              count: worldData!['todayCases'].toString(),
              textColor: colorWetAsphalt,
              panelColor: panelColor),
          StatusPanel(
              title: 'Total Cases',
              count: worldData!['cases'].toString(),
              textColor: colorWetAsphalt,
              panelColor: panelColor),
          StatusPanel(
              title: 'Today Deaths',
              count: worldData!['todayDeaths'].toString(),
              textColor: colorWetAsphalt,
              panelColor: panelColor),
          StatusPanel(
              title: 'Total Deaths',
              count: worldData!['deaths'].toString(),
              textColor: colorWetAsphalt,
              panelColor: panelColor),
          StatusPanel(
              title: 'Today Recovered',
              count: worldData!['todayRecovered'].toString(),
              textColor: colorWetAsphalt,
              panelColor: panelColor),
          StatusPanel(
              title: 'Total Recovered',
              count: worldData!['recovered'].toString(),
              textColor: colorWetAsphalt,
              panelColor: panelColor),
        ],
      ),
    );
  }
}

class StatusPanel extends StatelessWidget {
  final Color panelColor;
  final Color textColor;
  final String title;
  final String count;

  StatusPanel(
      {required this.panelColor,
      required this.textColor,
      required this.title,
      required this.count});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.all(9),
      color: panelColor,
      height: 70,
      width: width / 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).textSelectionColor),
          ),
          Text(
            count,
            style: TextStyle(
                fontSize: 16, color: Theme.of(context).textSelectionColor),
          )
        ],
      ),
    );
  }
}
