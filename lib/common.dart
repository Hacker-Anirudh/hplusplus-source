import 'package:url_launcher/url_launcher.dart';
import 'package:shared_preferences/shared_preferences.dart';

double graad = 2;
String klas = 'H428';
bool isDark = true;

int searchEngine = 1;
const Map<int, List<String>> searchEngines = {
  1: ['DuckDuckGo', 'https://duckduckgo.com/?q='],
  2: ['Google', 'https://www.google.com/search?q='],
  3: ['Bing', 'https://www.bing.com/search?q='],
  4: ['Brave', 'https://search.brave.com/search?q='],
  5: ['Ecosia', 'https://www.ecosia.org/search?q='],
  6: ['Yahoo', 'https://search.yahoo.com/search?p='],
  7: ['Startpage', 'https://www.startpage.com/sp/search?q='],
};

class Common {
  static void openlink(String url) {
    final Uri _url = Uri.parse(url);
    launchUrl(_url);
  }

  static Future<void> saveSearchEngine() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('searchEngine', searchEngine);
  }

  static Future<void> loadSearchEngine() async {
    final prefs = await SharedPreferences.getInstance();
    searchEngine = prefs.getInt('searchEngine') ?? 1;
  }

  static Future<void> saveClass() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('klas', klas);
  }

  static Future<void> loadClass() async {
    final prefs = await SharedPreferences.getInstance();
    klas = prefs.getString('klas') ?? 'H428';
  }

  static Future<void> saveTheme() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDark', isDark);
  }

  static Future<void> loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    isDark = prefs.getBool('isDark') ?? true;
  }

  static Future<void> saveGraad() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('graad', graad);
  }

  static Future<void> loadGraad() async {
    final prefs = await SharedPreferences.getInstance();
    graad = prefs.getDouble('graad') ?? 2.0;
  }
}
