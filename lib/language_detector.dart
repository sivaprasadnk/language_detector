library language_detector;

import 'package:flutter/cupertino.dart';
import 'package:translator/translator.dart';

class LanguageDetector {
  /// returns language-code of the passed [content] argument
  ///
  /// the [content] argument cannot be null.
  ///
  ///
  static Future<String> getLanguageCode({required String content}) async {
    final translator = GoogleTranslator();
    Translation translation = await translator.translate(content);
    var language = translation.sourceLanguage.code;
    if (language == "auto") {
      language = "en";
    }
    debugPrint('Language Code Detected : $language');
    return language;
  }

  /// returns language-name of the passed [content] argument
  ///
  /// the [content] argument cannot be null.
  ///
  ///
  static Future<String> getLanguageName({required String content}) async {
    final translator = GoogleTranslator();
    Translation translation = await translator.translate(content);
    var language = translation.sourceLanguage.name;
    if (language == "automatic") {
      language = "English";
    }
    debugPrint('Language Name Detected : $language');
    return language;
  }
}
