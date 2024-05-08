import 'package:flutter/material.dart';
import 'package:language_detector/language_detector.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Language Detector Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Language Detector Demo Page'),
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
  var language = "";
  TextEditingController textEditingController = TextEditingController();

  void detect() async {
    language = await LanguageDetector.getLanguageName(
        content: textEditingController.text);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 100),
            const Text(
              'Enter content:',
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: TextField(
                    controller: textEditingController,
                  ),
                ),
                const SizedBox(width: 50),
              ],
            ),
            const SizedBox(height: 40),
            OutlinedButton(
              onPressed: () {
                detect();
              },
              child: const Text("Get Language >"),
            ),
            const SizedBox(height: 100),
            Text(' Detected language : $language')
          ],
        ),
      ),
    );
  }
}
