import 'package:coronavirusapp/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'drawermenu.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({Key? key}) : super(key: key);
  static const faqsUrl =
      'https://covid19.saglik.gov.tr/TR-66125/sikca-sorulan-sorular-halka-yonelik.html';
  static const covid19Url = 'https://covid19.saglik.gov.tr/TR-66300/covid-19-nedir-.html';
  static const publicUrl = 'https://covid19.saglik.gov.tr/TR-66174/kamu-spotlari.html';

  Future _faqLaunchURL() async => await canLaunch(faqsUrl)
      ? await launch(faqsUrl)
      : throw 'Could not launch $faqsUrl';

  Future _covid19LaunchURL() async => await canLaunch(covid19Url)
      ? await launch(covid19Url) : throw 'Could not launch $covid19Url';

  Future _publicURL() async => await canLaunch(publicUrl)
      ? await launch(publicUrl) : throw 'Could not launch $publicUrl';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Info"),
      ),
      drawer: Drawer(
        child: DrawerMenu(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipPath(
              clipper: MyClipper(),
              child: Container(
                height: 350,
                width: double.infinity,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Color(0xffbdc3c7), Color(0xff7f8c8d)])),
                child: Image.asset("assets/images/doctorcorona.png"),
              ),
            ),
            Text(
              "Main symptoms of coronavirus",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Headache",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                ),
                Text("Cough",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15)),
                Text("Fever",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15)),
              ],
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 8.0, right: 8, top: 14, bottom: 10),
              child: Divider(
                thickness: 2,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Column(
              children: [
                InkWell(
                  onTap: () => _covid19LaunchURL(),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 11, horizontal: 11),
                    margin: EdgeInsets.all(10),
                    color: panelColor,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "COVID-19?",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Icon(Icons.arrow_forward)
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () => _faqLaunchURL(),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 11, horizontal: 11),
                    margin: EdgeInsets.all(10),
                    color: panelColor,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "FAQS",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Icon(Icons.arrow_forward)
                      ],
                    ),
                  ),
                ), InkWell(
                  onTap: () => _publicURL(),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 11, horizontal: 11),
                    margin: EdgeInsets.all(10),
                    color: panelColor,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Public Announcement",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Icon(Icons.arrow_forward)
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }

}
