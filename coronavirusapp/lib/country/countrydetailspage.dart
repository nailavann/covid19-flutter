import 'package:coronavirusapp/constants/constants.dart';
import 'package:coronavirusapp/country/detailspanel.dart';
import 'package:flutter/material.dart';

class CountryDetailsPage extends StatefulWidget {
  final countryData;
  final sortedCountryDatas;
  final sorted;

  const CountryDetailsPage({Key? key, required this.countryData,required this.sortedCountryDatas,this.sorted})
      : super(key: key);

  @override
  _CountryDetailsPageState createState() =>
      _CountryDetailsPageState(countryData,sortedCountryDatas,sorted);
}

class _CountryDetailsPageState extends State<CountryDetailsPage> {
  final countryData;
  final sortedCountryDatas;
  final sorted;

  _CountryDetailsPageState(this.countryData,this.sortedCountryDatas,this.sorted);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(sorted == false ? countryData['country'] : sortedCountryDatas['country']),
          centerTitle: true,
        ),
        body: countryData == null
            ? Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
              child: Column(
                  children: [
                    SizedBox(height: 25,),
                    DetailsPanel(
                      title: "Today Cases",
                      count: sorted == false ? countryData['todayCases'].toString() : sortedCountryDatas['todayCases'].toString(),
                      panelColor: panelColor,
                      textColor: Theme.of(context).textSelectionColor,
                    ),
                    DetailsPanel(
                        title: "Today Deaths",
                        count: sorted == false ? countryData['todayDeaths'].toString() : sortedCountryDatas['todayDeaths'].toString(),
                        panelColor:panelColor,
                        textColor: Theme.of(context).textSelectionColor),
                    DetailsPanel(
                      title: "Today Recovered",
                      count: sorted == false ? countryData['todayRecovered'].toString() : sortedCountryDatas['todayRecovered'].toString(),
                      panelColor: panelColor,
                      textColor: Theme.of(context).textSelectionColor,
                    ),DetailsPanel(
                      title: "Total Cases",
                      count: sorted == false ? countryData['cases'].toString() : sortedCountryDatas['cases'].toString(),
                      panelColor: panelColor,
                      textColor: Theme.of(context).textSelectionColor,
                    ), DetailsPanel(
                      title: "Total Deaths",
                      count: sorted == false ? countryData['deaths'].toString() : sortedCountryDatas['deaths'].toString(),
                      panelColor: panelColor,
                      textColor: Theme.of(context).textSelectionColor,
                    ),DetailsPanel(
                      title: "Total Recovered",
                      count: sorted == false ? countryData['recovered'].toString() : sortedCountryDatas['recovered'].toString(),
                      panelColor: panelColor,
                      textColor: Theme.of(context).textSelectionColor,
                    ),
                  ],
                ),
            ));
  }
}
