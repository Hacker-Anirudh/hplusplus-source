import 'package:flutter/material.dart';
import 'package:hplusplus/settings_screen.dart';
import 'package:hplusplus/common.dart';
import 'package:hplusplus/home_screen.dart';
import 'package:hplusplus/pixelart.dart';
import 'package:hplusplus/strings.dart';

void main() {
  runApp(const MyApp());
  Common.loadSearchEngine();
  Common.loadClass();
  Common.loadTheme();
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: MainStrings.title,

      theme: appTheme(),

      home: Scaffold(
        floatingActionButton: Padding(
          padding: const .all(40.0),
          child: FloatingActionButton(
            onPressed: () {},
            child: Tooltip(
              message: MainStrings.kleurenModusTooltip,
              child: IconButton(
                isSelected: isDark,
                onPressed: () {
                  setState(() {
                    isDark = !isDark;
                  });
                  Common.saveTheme();
                },
                icon: const Icon(Icons.wb_sunny_outlined),
                selectedIcon: const Icon(Icons.brightness_2_outlined),
              ),
            ),
          ),
        ),
        appBar: AppBar(
          title: const Text(
            MainStrings.appName,
            style: TextStyle(fontFamily: 'VT323', fontSize: 28),
          ),
          actions: [
            SizedBox(
              width: 250,
              child: TextField(
                onSubmitted: (String value) {
                  Common.openlink(searchEngines[searchEngine]![1] + value);
                },
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(64.0),
                  ),
                  hintText: MainStrings.zoekTerm,
                  labelText: searchEngines[searchEngine]![0],
                ),
              ),
            ),
          ],
        ),
        body: Row(
          children: [
            NavigationRail(
              selectedIndex: _selectedIndex,
              onDestinationSelected: (int index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              labelType: NavigationRailLabelType.all,
              destinations: const [
                NavigationRailDestination(
                  icon: Icon(Icons.home),
                  label: Text(MainStrings.navRail1),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.grid_4x4_rounded),
                  label: Text(MainStrings.navRail2),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.settings_rounded),
                  label: Text(MainStrings.navRail3),
                ),
              ],
            ),
            Expanded(
              child: {
                0: const HomeScreen(),
                1: const PixelArtScreen(),
                2: const SettingsScreen(),
              }[_selectedIndex]!,
            ),
          ],
        ),
      ),
    );
  }

  ThemeData appTheme() {
    return ThemeData(
      useMaterial3: true,
      brightness: isDark ? .dark : .light,
      colorScheme: ColorScheme.fromSeed(
        seedColor: isDark ? Colors.blueAccent : Colors.lightBlueAccent,
        brightness: isDark ? .dark : .light,
      ),
    );
  }
}
