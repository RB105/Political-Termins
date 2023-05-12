import 'package:flutter/material.dart';
import 'package:politicaltermins/data/model/temin_model.dart';

import '../pages/info_page.dart';

class MySearchDelegate extends SearchDelegate {
  
  final List<TerminModel> terminList;

  MySearchDelegate({required this.terminList});
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            if (query.isEmpty) {
              close(context, null);
            } else {
              query = '';
            }
          },
          icon: const Icon(Icons.clear_rounded))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    List<TerminModel> results = terminList.where((element) {
      return element.title!.toLowerCase().contains(query.toLowerCase());
    }).toList();
    return _listView(results);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<TerminModel> suggestions = terminList.where((element) {
      return element.title!.toLowerCase().contains(query.toLowerCase());
    }).toList();
    return _listView(suggestions);
  }

  ListView _listView(List<TerminModel> list) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        return ListTile(
          onTap: () {
             Navigator.push(context, MaterialPageRoute(builder: (context) => InfoPage(data: list[index]),));
          },
          title: Text(list[index].title.toString()),
        );
      },
    );
  }
}
