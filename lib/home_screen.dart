import 'package:flutter/material.dart';
import 'package:hplusplus/common.dart';
import 'package:hplusplus/db.dart';

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
                      Common.openlink('https://hhscholen.be');
                    },
                    icon: const Icon(Icons.language_rounded, size: 24),
                    label: Text('Website HHH', style: TextStyle(fontSize: 18)),
                    style: ElevatedButton.styleFrom(minimumSize: Size(280, 96)),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(24.0),
              child: Text(
                'Nuttige tools',
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
                      Common.openlink('https://hhhso-my.sharepoint.com/');
                    },
                    icon: Icon(Icons.cloud_rounded, size: 24),
                    label: Text('OneDrive', style: TextStyle(fontSize: 18)),
                    style: ElevatedButton.styleFrom(minimumSize: Size(280, 96)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Common.openlink('https://www.bidoc.net/hhh/index.html');
                    },
                    icon: Icon(Icons.book_rounded, size: 24),
                    label: Text(
                      'HHH Bibliotheek',
                      style: TextStyle(fontSize: 18),
                    ),
                    style: ElevatedButton.styleFrom(minimumSize: Size(280, 96)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Common.openlink('https://m365.cloud.microsoft/');
                    },
                    icon: const Icon(Icons.account_circle_rounded, size: 24),
                    label: Text(
                      'Microsoft Office',
                      style: TextStyle(fontSize: 18),
                    ),
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
