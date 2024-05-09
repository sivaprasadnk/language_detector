## Language Detector
Detect language of any text.


![Simulator Screenshot - iPhone 15 Pro - 2024-05-08 at 14 21 11 (1)](https://github.com/sivaprasadnk/language_detector/assets/75713903/68b995ed-d43e-448d-b3a0-3e86350bde1f)


## Getting started

Add this to your package's `pubspec.yaml` file

```yaml
dependencies:
  language_detector: ^0.0.2
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

