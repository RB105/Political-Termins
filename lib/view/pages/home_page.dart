import 'package:flutter/material.dart';
import 'package:politicaltermins/data/database/localdb.dart';
import 'package:politicaltermins/data/model/temin_model.dart';
import 'package:politicaltermins/view/pages/info_page.dart';
import 'package:politicaltermins/view/screens/nav_drawer_screen.dart';
import 'package:politicaltermins/view/screens/search_delegater.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavDrawer(),
      appBar: AppBar(
        title: const Text(
          "Political Termins",
          style: TextStyle(
              fontFamily: 'Rajdhani',
              fontWeight: FontWeight.bold,
              fontSize: 25),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                showSearch(
                    context: context,
                    delegate: MySearchDelegate(
                        terminList: LocalDatabase.localDatabase));
              },
              icon: const Icon(Icons.search_sharp))
        ],
      ),
      body: ListView.builder(
        itemCount: LocalDatabase.localDatabase.length,
        itemBuilder: (context, index) {
          List<TerminModel> data = LocalDatabase.localDatabase;
          return ListTile(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => InfoPage(data: data[index]),
                  ));
            },
            title: Text(data[index].title.toString()),
          );
        },
      ),
    );
  }
}
