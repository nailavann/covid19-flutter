import 'package:flutter/material.dart';

import 'drawermenu.dart';

class PieChartPage extends StatelessWidget {
  const PieChartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pie Chart"),
      ),
        drawer: Drawer(
          child: DrawerMenu(),
        ),
    );
  }
}
