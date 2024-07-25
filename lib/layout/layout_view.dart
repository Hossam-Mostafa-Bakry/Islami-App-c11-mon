import 'package:flutter/material.dart';
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
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/home_background.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "إسلامي",
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
          items: const [
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage(
                  ("assets/icons/quran_icn.png"),
                ),
              ),
              label: "Quran",
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage(
                  ("assets/icons/hadith_icn.png"),
                ),
              ),
              label: "Hadith",
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage(
                  ("assets/icons/sebha_icn.png"),
                ),
              ),
              label: "Sebha",
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage(
                  ("assets/icons/radio_icn.png"),
                ),
              ),
              label: "Radio",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: "Settings",
            ),
          ],
        ),
      ),
    );
  }
}
