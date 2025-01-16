import 'package:flutter/material.dart';
import 'package:language_info_plus/language_info_plus.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeLanguage(); // Optional: loads localized names
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Language Info Plus Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Language Info Plus Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Language> allLanguages = LanguageInfoPlus.languages;
  Language? deviceLanguage = LanguageInfoPlus.deviceLanguage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: allLanguages.length,
        itemBuilder: (context, index) {
          final language = allLanguages[index];
          return ListTile(
            leading: CircleAvatar(
              child: Text(language.code),
            ),
            title: Text(language.name),
            subtitle: Text(language.localizedName ?? "Unknown"),
          );
        },
      ),
    );
  }
}
