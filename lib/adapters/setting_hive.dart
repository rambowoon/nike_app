import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';

part 'setting_hive.g.dart';

@HiveType(typeId: 2)
class SettingHive extends HiveObject {
  @HiveField(0)
  @required
  String? themeMode;

  @HiveField(1)
  @required
  String? language;

  SettingHive({this.themeMode, this.language});

  SettingHive copyWith({String? themeMode, String? language}){
    return SettingHive(themeMode: themeMode ?? this.themeMode, language: language ?? this.language);
  }
}