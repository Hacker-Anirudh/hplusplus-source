import 'package:flutter/material.dart';
import 'package:hplusplus/common.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final TextEditingController _klasController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Text(
              'Klas selecteren',
              style: TextStyle(fontFamily: 'VT323', fontSize: 36),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: 650,
              child: TextField(
                controller: _klasController,
                decoration: const InputDecoration(
                  labelText: 'Voer klas in',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  setState(() {
                    klas = value.trim().toUpperCase();
                    if (klas.length > 1) {
                      final second = klas[1];
                      const Map<String, int> secondToGraad = {
                        '1': 1,
                        '2': 1,
                        '3': 2,
                        '4': 2,
                        '5': 3,
                        '6': 3,
                        '7': 3,
                        '8': 3,
                      };
                      if (secondToGraad.containsKey(second)) {
                        graad = secondToGraad[second]!.toDouble();
                      }
                    }
                  });
                  Common.saveClass();
                  Common.saveGraad();
                },
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Zoekmachine selecteren',
              style: TextStyle(fontFamily: 'VT323', fontSize: 36),
            ),
            const SizedBox(height: 16),
            Center(
              child: RadioGroup<int>(
                groupValue: searchEngine,
                onChanged: (value) {
                  setState(() {
                    searchEngine = value!;
                    Common.saveSearchEngine();
                  });
                },
                child: Column(
                  children: <Widget>[
                    ListTile(
                      title: Text('DuckDuckGo'),
                      leading: Radio<int>(value: 1),
                    ),
                    ListTile(
                      title: Text('Google'),
                      leading: Radio<int>(value: 2),
                    ),
                    ListTile(
                      title: Text('Bing'),
                      leading: Radio<int>(value: 3),
                    ),
                    ListTile(
                      title: Text('Brave'),
                      leading: Radio<int>(value: 4),
                    ),
                    ListTile(
                      title: Text('Ecosia'),
                      leading: Radio<int>(value: 5),
                    ),
                    ListTile(
                      title: Text('Yahoo'),
                      leading: Radio<int>(value: 6),
                    ),
                    ListTile(
                      title: Text('Startpage'),
                      leading: Radio<int>(value: 7),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
