## Language Detector

Detect language of any text.

![Simulator Screenshot - iPhone 15 Pro - 2024-05-08 at 14 21 11](https://github.com/sivaprasadnk/language_detector/assets/75713903/9840db35-2704-443a-a740-3ddb75193836)

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

