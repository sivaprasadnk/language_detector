## Language Detector

Detect language of any text.

## Getting started

Add this to your package's `pubspec.yaml` file

```yaml
dependencies:
  language_detector: ^0.0.1
```

## Usage

Next, you just have to import the package using:

```dart
import 'package:language_detector/language_detector.dart';
```


```dart
  Widget build(BuildContext context) {
   return OutlinedButton(
              onPressed: () async {
                language = await LanguageDetector.getLanguageName(
                    content: 'helo');
              },
              child: const Text("Get Language >"),
            ),
  }
```
## Additional information

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

