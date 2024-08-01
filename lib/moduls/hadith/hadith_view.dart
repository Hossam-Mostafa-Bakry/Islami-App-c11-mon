import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:islami_app_c11_mon/moduls/hadith/hadith_details_view.dart';

class HadithView extends StatefulWidget {
  const HadithView({super.key});

  @override
  State<HadithView> createState() => _HadithViewState();
}

class _HadithViewState extends State<HadithView> {
  List<HadithData> hadithDataList = [];

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    if (hadithDataList.isEmpty) loadHadithData();
    return Column(
      children: [
        Image.asset(
          "assets/icons/hadith_header.png",
          scale: 3,
        ),
        const Divider(),
        Text(
          "الأحاديث",
          style: theme.textTheme.bodyLarge,
        ),
        const Divider(),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return Bounceable(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    HadithDetailsView.routeName,
                    arguments: hadithDataList[index],
                  );
                },
                child: Text(
                  hadithDataList[index].title,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyMedium!.copyWith(height: 1.8),
                ),
              );
            },
            itemCount: hadithDataList.length,
          ),
        )
      ],
    );
  }

  Future<void> loadHadithData() async {
    String content = await rootBundle.loadString("assets/files/ahadeth.txt");

    List<String> allHadithDataList = content.split("#");

    for (int i = 0; i < allHadithDataList.length; i++) {
      String singleHadithData = allHadithDataList[i].trim();

      // const string = 'dartlang';
      // var result = string.substring(1); // 'artlang'
      // result = string.substring(1, 4);
      // 'art

      int indexLength = singleHadithData.indexOf("\n");
      String title = singleHadithData.substring(0, indexLength);
      String bodyContent = singleHadithData.substring(indexLength + 1);

      HadithData hadithData = HadithData(
        title: title,
        bodyContent: bodyContent,
      );
      setState(() {});
      hadithDataList.add(hadithData);
    }
  }
}

class HadithData {
  final String title;
  final String bodyContent;

  HadithData({
    required this.title,
    required this.bodyContent,
  });
}
