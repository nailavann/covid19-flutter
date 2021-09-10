import 'package:flutter/material.dart';

class DetailsPanel extends StatelessWidget {
  final String title;
  final String count;
  var textColor;
  final Color panelColor;
   DetailsPanel({Key? key,required this.title,required this.count,required this.textColor,required this.panelColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 20,vertical: 3),
        color: panelColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(title,style: TextStyle(color: textColor,fontSize: 19,fontWeight: FontWeight.bold),),
                    SizedBox(height: 5,),
                    Text(count,style: TextStyle(color: textColor,fontSize: 16,fontWeight: FontWeight.bold),),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
