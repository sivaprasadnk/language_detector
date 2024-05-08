import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:language_detector/language_detector.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 100),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
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
                  const Text('OR'),
                  const SizedBox(width: 50),
                  OutlinedButton(
                    onPressed: () async {
                      final clipboardData =
                          await Clipboard.getData(Clipboard.kTextPlain);
                      String? clipboardText = clipboardData?.text;
                      textEditingController.text = clipboardText!;
                      debugPrint(clipboardText);
                    },
                    child: const Text("Paste from clipboard"),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const SizedBox(height: 20),
              OutlinedButton(
                onPressed: () {
                  detect();
                },
                child: const Text("Get Language"),
              ),
              const SizedBox(height: 20),
              if (language.isNotEmpty) Text(' Detected language : $language')
            ],
          ),
        ),
      ),
    );
  }
}
