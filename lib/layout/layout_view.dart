import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app_c11_mon/moduls/hadith/hadith_view.dart';
import 'package:islami_app_c11_mon/moduls/quran/quran_view.dart';
import 'package:islami_app_c11_mon/moduls/sebha/sebha_view.dart';
import 'package:islami_app_c11_mon/moduls/settings/settings_view.dart';

import '../moduls/radio/radio_view.dart';

class LayOutView extends StatefulWidget {
  static const String routeName = "layouts";

  const LayOutView({super.key});

  @override
  State<LayOutView> createState() => _LayOutViewState();
}

class _LayOutViewState extends State<LayOutView> {
  int selectedIndex = 0;

  List<Widget> screensList = [
    const QuranView(),
    const HadithView(),
    const SebhaView(),
    const RadioView(),
    const SettingsView(),
  ];

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var lang = AppLocalizations.of(context)!;

    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/home_background.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            lang.islami,
          ),
        ),
        body: screensList[selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: const ImageIcon(
                AssetImage(
                  ("assets/icons/quran_icn.png"),
                ),
              ),
              label: lang.quran,
            ),
            BottomNavigationBarItem(
              icon: const ImageIcon(
                AssetImage(
                  ("assets/icons/hadith_icn.png"),
                ),
              ),
              label: lang.hadith,
            ),
            BottomNavigationBarItem(
              icon: const ImageIcon(
                AssetImage(
                  ("assets/icons/sebha_icn.png"),
                ),
              ),
              label: lang.tasbeh,
            ),
            BottomNavigationBarItem(
              icon: const ImageIcon(
                AssetImage(
                  ("assets/icons/radio_icn.png"),
                ),
              ),
              label: lang.radio,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.settings),
              label: lang.setting,
            ),
          ],
        ),
      ),
    );
  }
}
