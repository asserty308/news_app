import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';

class SecretLoader {
  static final instance = SecretLoader();

  Map<String, dynamic> _secrets;

  Future<void> _loadSecrets() async {
    await rootBundle.loadStructuredData('assets/secrets.json', (jsonStr) async {
      _secrets = json.decode(jsonStr);
    });
  }

  Future<dynamic> loadSecret(String key) async {
    if (_secrets == null) {
      await _loadSecrets();
    }

    return _secrets[key];
  }
}