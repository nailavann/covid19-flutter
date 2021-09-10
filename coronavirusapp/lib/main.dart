import 'dart:convert';

import 'package:coronavirusapp/country/countrypage.dart';
import 'package:coronavirusapp/worldpanel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'drawermenu.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Color darkModeButton = Color(0xffbdc3c7);
  Color lightModeButton = Color(0xFF161E35);
  Color darkModeTextColor = Color(0xffffffff);
  Color lightModeTextColor = Color(0xFF161E35);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textSelectionTheme: TextSelectionThemeData(
            // light mode settings
            selectionColor: lightModeTextColor,
            cursorColor: Colors.blue,
        ),
        colorScheme: ColorScheme.fromSwatch(
          backgroundColor: lightModeButton
        ),
        brightness: Brightness.light,
        primaryColor: lightModeButton,
      ),
      darkTheme: ThemeData(
          //dark mode settings
          textSelectionTheme: TextSelectionThemeData(
              // light mode settings
              selectionColor: darkModeTextColor,
              cursorColor: Colors.red),
          brightness: Brightness.dark),
      themeMode: ThemeMode.system,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Map? worldData;

  fetchGlobalData() async {
    var url = Uri.parse("https://disease.sh/v3/covid-19/all");
    var response = await http.get(url);
    setState(() {
      worldData = json.decode(response.body);
    });
  }

  Future fetchData() async {
    fetchGlobalData();
    print("fetch data called");
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("COVID-19"),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: DrawerMenu(),
      ),
      body: RefreshIndicator(
        onRefresh: fetchData,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Container(
                child: Text("CORONAVIRUS STATS",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 23)),
                alignment: Alignment.center,
              ),
              SizedBox(
                height: 24,
              ),
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: Text(
                  "World Wide",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
                ),
              ),
              worldData == null
                  ? Center(child: CircularProgressIndicator())
                  : WorldPanel(
                      worldData: worldData,
                    ),
              SizedBox(
                height: 33,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CountryPage(),
                      ));
                },
                child: Card(
                  child: Container(
                    padding: EdgeInsets.all(15),
                    child: Text(
                      "Country Details",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.background,
                        borderRadius: BorderRadius.circular(15)),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
