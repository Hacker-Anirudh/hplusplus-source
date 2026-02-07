import 'package:flutter/material.dart';
import 'package:hplusplus/common.dart';
import 'package:hplusplus/db.dart';
import 'strings.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            const Padding(
              padding: .all(24.0),
              child: Text(
                HomeStrings.belangrijk,
                style: TextStyle(fontFamily: 'VT323', fontSize: 36),
              ),
            ),
            Row(
              mainAxisAlignment: .center,
              children: [
                Padding(
                  padding: const .all(8.0),
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Common.openlink(
                        'https://hhscholen.schoolware.be/webleerling/start.html',
                      );
                    },
                    icon: const Icon(Icons.calendar_today_rounded, size: 24),
                    label: const Text(
                      'Schoolware',
                      style: TextStyle(fontSize: 18),
                    ),
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(280, 96),
                    ),
                  ),
                ),
                Padding(
                  padding: const .all(8.0),
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Common.openlink('https://outlook.cloud.microsoft/mail/');
                    },
                    icon: const Icon(Icons.email_rounded, size: 24),
                    label: const Text(
                      'Outlook',
                      style: TextStyle(fontSize: 18),
                    ),
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(280, 96),
                    ),
                  ),
                ),
                Padding(
                  padding: const .all(8.0),
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Common.openlink('https://teams.microsoft.com/v2/');
                    },
                    icon: const Icon(Icons.groups_rounded, size: 24),
                    label: const Text('Teams', style: TextStyle(fontSize: 18)),
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(280, 96),
                    ),
                  ),
                ),
              ],
            ),
            const Padding(
              padding: .all(24.0),
              child: Text(
                HomeStrings.info,
                style: TextStyle(fontFamily: 'VT323', fontSize: 36),
              ),
            ),
            Row(
              mainAxisAlignment: .center,
              children: [
                Padding(
                  padding: const .all(8.0),
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Common.openlink(
                        'https://llnroosters.hhscholen.be/klassen/ed${classMap[klas]}p00001s3fffffffffffffff_${klas.toLowerCase()}_vs.png',
                      );
                    },
                    icon: const Icon(Icons.grid_3x3_rounded, size: 24),
                    label: const Text(
                      'Lessenrooster',
                      style: TextStyle(fontSize: 18),
                    ),
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(280, 96),
                    ),
                  ),
                ),
                Padding(
                  padding: const .all(8.0),
                  child: ElevatedButton.icon(
                    onPressed: () {
                      int _graad = graad.toInt();
                      Common.openlink(
                        'https://hhh.exxeda.com/overzicht/vervangingen?graad=$_graad',
                      );
                    },
                    icon: const Icon(Icons.question_mark_rounded, size: 24),
                    label: const Text(
                      'Afwezigen en vervangingen',
                      style: TextStyle(fontSize: 18),
                    ),
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(280, 96),
                    ),
                  ),
                ),
                Padding(
                  padding: const .all(8.0),
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Common.openlink('https://hhscholen.be');
                    },
                    icon: const Icon(Icons.language_rounded, size: 24),
                    label: const Text(
                      'Website HHH',
                      style: TextStyle(fontSize: 18),
                    ),
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(280, 96),
                    ),
                  ),
                ),
              ],
            ),
            const Padding(
              padding: .all(24.0),
              child: Text(
                HomeStrings.tools,
                style: TextStyle(fontFamily: 'VT323', fontSize: 36),
              ),
            ),
            Row(
              mainAxisAlignment: .center,
              children: [
                Padding(
                  padding: const .all(8.0),
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Common.openlink('https://hhhso-my.sharepoint.com/');
                    },
                    icon: const Icon(Icons.cloud_rounded, size: 24),
                    label: const Text(
                      'OneDrive',
                      style: TextStyle(fontSize: 18),
                    ),
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(280, 96),
                    ),
                  ),
                ),
                Padding(
                  padding: const .all(8.0),
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Common.openlink('https://www.bidoc.net/hhh/index.html');
                    },
                    icon: const Icon(Icons.book_rounded, size: 24),
                    label: const Text(
                      'HHH Bibliotheek',
                      style: TextStyle(fontSize: 18),
                    ),
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(280, 96),
                    ),
                  ),
                ),
                Padding(
                  padding: const .all(8.0),
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Common.openlink('https://m365.cloud.microsoft/');
                    },
                    icon: const Icon(Icons.account_circle_rounded, size: 24),
                    label: const Text(
                      'Microsoft Office',
                      style: TextStyle(fontSize: 18),
                    ),
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(280, 96),
                    ),
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
