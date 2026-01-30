import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDark = true;
  static const searchEngine = 1; // TODO: Implement user choice and cookies.
  static const Map<int, List> searchEngines = {1: ["DuckDuckGo", 'https://duckduckgo.com/?q='], 2: ["Google",'https://www.google.com/search?q='], 3: ["Bing", 'https://www.bing.com/search?q='], 4: ["Brave", 'https://search.brave.com/search?q='], 5: ["Ecosia", 'https://www.ecosia.org/search?q='], 6: ["Yahoo", 'https://search.yahoo.com/search?p='], 7: ["Startpage", 'https://www.startpage.com/sp/search?q=']};
  static const graad = 2; //TODO: Add option to select this.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'H++',

      theme: ThemeData(
        useMaterial3: true,
        brightness: isDark ? Brightness.dark : Brightness.light,
        colorScheme: ColorScheme.fromSeed(
          seedColor: isDark ? Colors.blueAccent : Colors.lightBlueAccent,
          brightness: isDark ? Brightness.dark : Brightness.light,
        ),
      ),

      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
                  isDark = !isDark;
                });
          },
          child: Tooltip(
            message: 'Verander van kleurenmodus',
            child: Icon(isDark ? Icons.wb_sunny_outlined : Icons.brightness_2_outlined),
          ),
        ),
        appBar: AppBar(
          title: const Text('H++ Startpagina', style: TextStyle(fontFamily: 'VT323', fontSize: 28)),
                  actions: [
          SizedBox(
            width: 250,
            child: TextField(
              onSubmitted: (String value) {
                _openlink(searchEngines[searchEngine]![1]! + value);
              },
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(64.0),
                ),
                hintText: 'Tik een zoekterm in',
                labelText: 'Zoeken met ${searchEngines[searchEngine]![0]!}',
              ),
            ),
          ),
        ],
        ),
        body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: .center,
              children: [
                Padding(padding:  EdgeInsets.all(24.0),
                child: Text("Belangrijk", style: TextStyle(fontFamily: 'VT323', fontSize: 36)),
              ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton.icon(
                        onPressed: () {
                          _openlink("https://hhscholen.schoolware.be/webleerling/start.html");
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
                          _openlink("https://outlook.cloud.microsoft/mail/");
                        },
                        icon: Icon(Icons.email_rounded, size: 24),
                        label: Text('Outlook', style: TextStyle(fontSize: 18)),
                        style: ElevatedButton.styleFrom(minimumSize: Size(280, 96)),
                      ),
                    ),
                    Padding(padding:  EdgeInsets.all(8.0),
                    child: ElevatedButton.icon(
                      onPressed: () {
                        _openlink("https://teams.microsoft.com/v2/");
                      },
                      icon: Icon(Icons.groups_rounded, size: 24),
                      label: Text('Teams', style: TextStyle(fontSize: 18)),
                      style: ElevatedButton.styleFrom(minimumSize: Size(280, 96)),     
                    )
                    ),
                    Padding(padding:  EdgeInsets.all(8.0),
                    child: ElevatedButton.icon(
                      onPressed: () {
                        _openlink("https://hhh.exxeda.com/overzicht/vervangingen?graad=$graad");
                      },
                      icon: Icon(Icons.question_mark_rounded, size: 24),
                      label: Text('Afwezigen en vervangingen', style: TextStyle(fontSize: 18)),
                      style: ElevatedButton.styleFrom(minimumSize: Size(280, 96)),     
                    )
                    ),
                  ],
                )
              ],
          )
          )  
      ),
    );
  }
}

void _openlink(String url) {
  final Uri _url = Uri.parse(url);
  launchUrl(_url);
}