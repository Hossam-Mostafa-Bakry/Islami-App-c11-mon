import 'package:flutter/material.dart';
import 'package:islami_app_c11_mon/moduls/hadith/hadith_view.dart';

class HadithDetailsView extends StatelessWidget {
  static const String routeName = "HadithDetails";

  const HadithDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var data = ModalRoute.of(context)?.settings.arguments as HadithData;

    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/home_background.png"),
          fit: BoxFit.cover,
        ),
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
              Text(
                data.title,
                style: theme.textTheme.bodyMedium,
              ),
              const Divider(),
              Expanded(
                child: ListView(
                  children: [
                    Text(
                      data.bodyContent,
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
