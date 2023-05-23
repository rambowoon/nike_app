import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nike/providers/setting_notifier.dart';

final settingProvider = NotifierProvider<SettingNotifier, ThemeMode>(() {
  return SettingNotifier();
});

final languageProvider = NotifierProvider<LanguageNotifier, Locale>(() {
  return LanguageNotifier();
});