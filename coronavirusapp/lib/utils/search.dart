import 'package:coronavirusapp/country/countrydetailspage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'dialogs.dart';

class Search extends SearchDelegate {
  final List countryList;
  final List countryListSorted;
  final bool sortedCheck;

  Search(this.countryList, this.countryListSorted, this.sortedCheck);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      query.isNotEmpty ? IconButton(
          onPressed: () {
            query = '';
          },
          icon: Icon(Icons.clear)) : Container()
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? countryList
        : countryList
            .where((element) =>
                element['country'].toString().toLowerCase().startsWith(query.toLowerCase()))
            .toList();

    final suggestionListSorted = query.isEmpty
        ? countryListSorted
        : countryListSorted
            .where((element) =>
                element['country'].toString().toLowerCase().startsWith(query.toLowerCase()))
            .toList();

    return ListView.builder(
      itemCount: suggestionList == null ? 0 : suggestionList.length,
      itemBuilder: (context, index) {
        final suggestionListDetail = suggestionList[index];
        final suggestionListDetailSorted = suggestionListSorted[index];
        return Padding(
          padding: const EdgeInsets.only(
              left: 8.0, top: 8.0, bottom: 5.0, right: 8.0),
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CountryDetailsPage(
                        countryData: suggestionListDetail,
                        sortedCountryDatas: suggestionListDetailSorted,
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
                            ? suggestionList[index]['countryInfo']['flag']
                            : suggestionListSorted[index]['countryInfo']
                        ['flag'],
                        width: 70,
                      ),
                      title: Text(
                        sortedCheck == false
                            ? suggestionList[index]['country']
                            : suggestionListSorted[index]['country'],
                        style: TextStyle(
                            color: Theme.of(context).textSelectionColor,
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
                            suggestionList[index]['continent']
                            : "Continent: " +
                            suggestionListSorted[index]['continent'],
                        sortedCheck == false
                            ? "Population: " +
                            suggestionList[index]['population'].toString()
                            : "Population: " +
                            suggestionListSorted[index]['population'].toString(),
                        null,
                        null);
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
