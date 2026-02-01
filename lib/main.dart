import 'package:flutter/material.dart';
import 'package:hplusplus/settings_screen.dart';
import 'package:hplusplus/common.dart';

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
              child: _selectedIndex == 0 ? homeScreen() : SettingsScreen(),
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

  Scaffold homeScreen() {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            isDark = !isDark;
          });
        },
        child: Tooltip(
          message: 'Verander van kleurenmodus',
          child: Icon(
            isDark ? Icons.wb_sunny_outlined : Icons.brightness_2_outlined,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            Padding(
              padding: EdgeInsets.all(24.0),
              child: Text(
                'Belangrijk',
                style: TextStyle(fontFamily: 'VT323', fontSize: 36),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Common.openlink(
                        'https://hhscholen.schoolware.be/webleerling/start.html',
                      );
                    },
                    icon: Icon(Icons.calendar_today_rounded, size: 24),
                    label: Text('Schoolware', style: TextStyle(fontSize: 18)),
                    style: ElevatedButton.styleFrom(minimumSize: Size(280, 96)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Common.openlink('https://outlook.cloud.microsoft/mail/');
                    },
                    icon: Icon(Icons.email_rounded, size: 24),
                    label: Text('Outlook', style: TextStyle(fontSize: 18)),
                    style: ElevatedButton.styleFrom(minimumSize: Size(280, 96)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Common.openlink('https://teams.microsoft.com/v2/');
                    },
                    icon: Icon(Icons.groups_rounded, size: 24),
                    label: Text('Teams', style: TextStyle(fontSize: 18)),
                    style: ElevatedButton.styleFrom(minimumSize: Size(280, 96)),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(24.0),
              child: Text(
                'Info',
                style: TextStyle(fontFamily: 'VT323', fontSize: 36),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Common.openlink(
                        'https://llnroosters.hhscholen.be/klassen/ed${classMap[klas]}p00001s3fffffffffffffff_${klas.toLowerCase()}_vs.png',
                      );
                    },
                    icon: Icon(Icons.grid_3x3_rounded, size: 24),
                    label: Text(
                      'Lessenrooster',
                      style: TextStyle(fontSize: 18),
                    ),
                    style: ElevatedButton.styleFrom(minimumSize: Size(280, 96)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: ElevatedButton.icon(
                    onPressed: () {
                      int _graad = graad.toInt();
                      Common.openlink(
                        'https://hhh.exxeda.com/overzicht/vervangingen?graad=$_graad',
                      );
                    },
                    icon: Icon(Icons.question_mark_rounded, size: 24),
                    label: Text(
                      'Afwezigen en vervangingen',
                      style: TextStyle(fontSize: 18),
                    ),
                    style: ElevatedButton.styleFrom(minimumSize: Size(280, 96)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: ElevatedButton.icon(
                    onPressed: () {
                      int _graad = graad.toInt();
                      Common.openlink('https://hhscholen.be');
                    },
                    icon: const Icon(Icons.language_rounded, size: 24),
                    label: Text('Website HHH', style: TextStyle(fontSize: 18)),
                    style: ElevatedButton.styleFrom(minimumSize: Size(280, 96)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
