import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '/moduls/quran/quran_view.dart';

class QuranDetailsView extends StatefulWidget {
  static const String routeName = "QuranDetails";

  const QuranDetailsView({super.key});

  @override
  State<QuranDetailsView> createState() => _QuranDetailsViewState();
}

class _QuranDetailsViewState extends State<QuranDetailsView> {
  List<String> versesList = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var data = ModalRoute.of(context)?.settings.arguments as SuraData;

    if (versesList.isEmpty) loadQuranData(data.suraNumber); // async

    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/home_background.png"),
            fit: BoxFit.cover),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("إسلامي"),
        ),
        body: Container(
          margin: const EdgeInsets.only(
            top: 10,
            left: 30,
            right: 30,
            bottom: 80,
          ),
          padding: const EdgeInsets.only(
            top: 30,
            left: 30,
            right: 30,
            bottom: 80,
          ),
          decoration: BoxDecoration(
              color: const Color(0xFFF8F8F8).withOpacity(0.8),
              borderRadius: BorderRadius.circular(25)),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    " سورة ${data.suraName}",
                    style: theme.textTheme.bodyMedium,
                  ),
                  const SizedBox(width: 15),
                  const Icon(Icons.play_circle_fill_rounded)
                ],
              ),
              const Divider(),
              if (versesList.isEmpty)
                const Expanded(
                  child: Text("No Data Loaded"),
                ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      " {${index + 1}} ${versesList[index]}",
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodySmall,
                    ),
                  ),
                  itemCount: versesList.length,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> loadQuranData(String suraNumber) async {
    // async vs sync
    // Future<String>
    String content =
        await rootBundle.loadString("assets/files/$suraNumber.txt");
    versesList = content.split("\n");
    setState(() {});
  }
}
