import 'dart:convert';

import 'package:coronavirusapp/country/countrypiechart.dart';
import 'package:coronavirusapp/utils/dialogs.dart';
import 'package:coronavirusapp/utils/search.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:progress_dialog/progress_dialog.dart';
import '../drawermenu.dart';
import 'countrydetailspage.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../utils/progress.dart';

class CountryPage extends StatefulWidget {
  const CountryPage({Key? key}) : super(key: key);

  @override
  _CountryPageState createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {
  List? countryData;
  List? sortedCountryData;
  bool sortedCheck = false;

  fetchCountryData() async {
    var url = Uri.parse("https://corona.lmao.ninja/v2/countries");
    var response = await http.get(url);
    setState(() {
      countryData = json.decode(response.body);
    });
  }

  fetchSortedCountryData() async {
    var url = Uri.parse("https://corona.lmao.ninja/v2/countries?sort=cases");
    var response = await http.get(url);
    setState(() {
      sortedCountryData = json.decode(response.body);
    });
  }

  @override
  void initState() {
    fetchCountryData();
    fetchSortedCountryData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Country"),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(
                  context: context,
                  delegate:
                      Search(countryData!, sortedCountryData!, sortedCheck));
            },
            icon: Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {
              if (sortedCheck) {
                Dialogs.warningDialog(
                    context, null, "Total cases already listed", null, null);
              } else {
                Dialogs.noHeaderDialog(context, "Are you sure?",
                    "Want to sort countries by total cases?", () {}, () async {
                  ProgressDialog pr = await Progress.showLoadingDialog(
                      context, "Countries are listed...");
                  await pr.show();
                  setState(() {
                    sortedCheck = true;
                    final snackBar = SnackBar(
                      content: Text("List sorted by highest total cases"),
                      duration: Duration(seconds: 4),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  });
                  await pr.hide();
                });
              }
            },
            icon: Icon(Icons.sort),
          ),
        ],
      ),
      drawer: Drawer(
        child: DrawerMenu(),
      ),
      body: countryData == null
          ? Center(child: CircularProgressIndicator())
          : sortedCountryData == null
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: countryData == null ? 0 : countryData!.length,
                  itemBuilder: (context, index) {
                    final countryDetailData = countryData![index];
                    final sortedCountry = sortedCountryData![index];

                    return Padding(
                      padding: const EdgeInsets.only(
                          left: 8.0, top: 8.0, bottom: 5.0, right: 8.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CountryDetailsPage(
                                    countryData: countryDetailData,
                                    sortedCountryDatas: sortedCountry,
                                    sorted: sortedCheck),
                              ));
                        },
                        child: Slidable(
                          actionPane: SlidableDrawerActionPane(),
                          actionExtentRatio: 0.25,
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SingleChildScrollView(
                                child: ListTile(
                                  leading: Image.network(
                                    sortedCheck == false
                                        ? countryDetailData['countryInfo']
                                            ['flag']
                                        : sortedCountry['countryInfo']['flag'],
                                    width: 70,
                                  ),
                                  title: Text(
                                    sortedCheck == false
                                        ? countryDetailData['country']
                                        : sortedCountry['country'],
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .textSelectionTheme
                                            .selectionColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          secondaryActions: [
                            IconSlideAction(
                              color: Colors.red,
                              icon: Icons.info,
                              onTap: () {
                                Dialogs.noHeaderDialog(
                                    context,
                                    sortedCheck == false
                                        ? "Continent: " +
                                            countryDetailData['continent']
                                        : "Continent: " +
                                            sortedCountry['continent'],
                                    sortedCheck == false
                                        ? "Population: " +
                                            countryDetailData['population']
                                                .toString()
                                        : "Population: " +
                                            sortedCountry['population']
                                                .toString(),
                                    null,
                                    null);
                              },
                            ),
                            IconSlideAction(
                              color: Colors.indigo,
                              icon: Icons.pie_chart,
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => CountryPieChart(
                                        countryData: countryDetailData,
                                        sortedCountryData: sortedCountry,
                                        sorted: sortedCheck
                                      ),
                                    ));
                              },
                            )
                          ],
                        ),
                      ),
                    );
                  }),
    );
  }
}
