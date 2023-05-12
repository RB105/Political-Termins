import 'package:flutter/material.dart';
import 'package:politicaltermins/data/database/saved_termins_list.dart';
import 'package:politicaltermins/view/pages/info_page.dart';

class SavedTerminsPage extends StatelessWidget {
  const SavedTerminsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Saved Termins Collection"),
        ),
        body: ListView.builder(
          itemCount: SavedTermins.savedTermins.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          InfoPage(data: SavedTermins.savedTermins[index]),
                    ));
              },
              title: Text(SavedTermins.savedTermins[index].title.toString()),
            );
          },
        ));
  }
}
