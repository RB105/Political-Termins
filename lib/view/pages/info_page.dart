import 'package:flutter/material.dart';
import 'package:politicaltermins/core/widgets/show_message_helper.dart';
import 'package:politicaltermins/data/database/saved_termins_list.dart';
import 'package:politicaltermins/data/model/temin_model.dart';

class InfoPage extends StatefulWidget {
  final TerminModel data;

  const InfoPage({super.key, required this.data});

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.data.title.toString()),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  if (!SavedTermins.savedTermins.contains(widget.data)) {
                    SavedTermins.savedTermins.add(widget.data);
                    setState(() {});
                    showMessageHelper(
                        "${widget.data.title} added to collection");
                  } else {
                    SavedTermins.savedTermins.remove(widget.data);
                    setState(() {});
                    showMessageHelper(
                        "${widget.data.title} removed from collection");
                  }
                },
                icon: !SavedTermins.savedTermins.contains(widget.data)
                    ? const Icon(Icons.bookmark_border)
                    : const Icon(Icons.bookmark))
          ],
        ),
        body: Column(
          children: [
            ListTile(
              title: Text(widget.data.language.toString()),
              subtitle: Text(widget.data.meaning.toString()),
            ),
            ListTile(
              title: Text(widget.data.desc.toString()),
            )
          ],
        ));
  }
}
