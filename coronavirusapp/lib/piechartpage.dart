import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'drawermenu.dart';
import 'package:http/http.dart' as http;

class PieChartPage extends StatefulWidget {
  const PieChartPage({Key? key}) : super(key: key);

  @override
  State<PieChartPage> createState() => _PieChartPageState();
}

class _PieChartPageState extends State<PieChartPage> {
  Map? worldData;

  @override
  void initState() {
    fetchGlobalData();
    super.initState();
  }

  fetchGlobalData() async {
    var url = Uri.parse("https://disease.sh/v3/covid-19/all");
    var response = await http.get(url);
    setState(() {
      worldData = json.decode(response.body);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pie Chart "),
      ),
      drawer: Drawer(
        child: DrawerMenu(),
      ),
      body: worldData == null
          ? Center(child: CircularProgressIndicator())
          : Column(
        children: [
          SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text("World Data",style: TextStyle(color: Theme.of(context)
                .textSelectionTheme.selectionColor,fontSize: 18,fontWeight: FontWeight.bold)),
          ),
          Expanded(
            child: PieChart(dataMap: {
              'Cases': double.parse(worldData!['cases'].toString()),
              'Active': double.parse(worldData!['active'].toString()),
              'Recovered': double.parse(worldData!['recovered'].toString()),
              'Deaths': double.parse(worldData!['deaths'].toString()),
            }),
          ),
        ],
      )
    );
  }
}
