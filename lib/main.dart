import 'package:flutter/material.dart';
import 'package:hplusplus/settings_screen.dart';
import 'package:hplusplus/common.dart';
import 'package:hplusplus/home_screen.dart';

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
      title: 'H++',

      theme: appTheme(),

      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Tooltip(
            message: 'Verander van kleurenmodus',
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
        appBar: AppBar(
          title: const Text(
            'H++ Startpagina',
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
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(64.0),
                  ),
                  hintText: 'Tik een zoekterm in',
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
                  label: Text('Start'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.settings_rounded),
                  label: Text('Instellingen'),
                ),
              ],
            ),
            Expanded(
              child: _selectedIndex == 0 ? HomeScreen() : SettingsScreen(),
            ),
          ],
        ),
      ),
    );
  }

  ThemeData appTheme() {
    return ThemeData(
      useMaterial3: true,
      brightness: isDark ? Brightness.dark : Brightness.light,
      colorScheme: ColorScheme.fromSeed(
        seedColor: isDark ? Colors.blueAccent : Colors.lightBlueAccent,
        brightness: isDark ? Brightness.dark : Brightness.light,
      ),
    );
  }
}
