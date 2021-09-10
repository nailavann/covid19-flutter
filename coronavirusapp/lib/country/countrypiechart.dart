import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class CountryPieChart extends StatefulWidget {
  final countryData;
  final sortedCountryData;
  final sorted;

  const CountryPieChart(
      {Key? key,
      required this.countryData,
      required this.sortedCountryData,
      required this.sorted})
      : super(key: key);

  @override
  _CountryPieChartState createState() =>
      _CountryPieChartState(countryData, sortedCountryData, sorted);
}

class _CountryPieChartState extends State<CountryPieChart> {
  final countryData;
  final sortedCountryData;
  final sorted;

  _CountryPieChartState(this.countryData, this.sortedCountryData, this.sorted);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(sorted == false
              ? countryData['country']
              : sortedCountryData['country']),
        ),
        body: countryData == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      sorted == false
                          ? countryData['country'] + " Total Stats"
                          : sortedCountryData['country'] + " Total Stats",
                      style: TextStyle(
                          color: Theme.of(context)
                              .textSelectionTheme
                              .selectionColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: PieChart(
                        dataMap: {
                          'Cases': double.parse(sorted == false
                              ? countryData['cases'].toString()
                              : sortedCountryData['cases'].toString()),
                          'Deaths': double.parse(sorted == false
                              ? countryData['deaths'].toString()
                              : sortedCountryData['deaths'].toString()),
                          'Recovered': double.parse(sorted == false
                              ? countryData['recovered'].toString()
                              : sortedCountryData['recovered'].toString()),
                        },
                        legendOptions: LegendOptions(
                          showLegendsInRow: true,
                          legendPosition: LegendPosition.top,
                          showLegends: true,
                          legendTextStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        chartRadius: MediaQuery.of(context).size.width / 1.4,
                        chartValuesOptions:
                            ChartValuesOptions(showChartValuesOutside: true),
                      ),
                    ),
                  )
                ],
              ));
  }
}
