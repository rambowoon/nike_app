import 'package:hive_flutter/adapters.dart';
import 'adapters/setting_hive.dart';

class AppInit{
  static late final Box<SettingHive> _box;
  static late SettingHive settingHive;

  static settup() async {
    _box = await Hive.openBox('setting');
    if(_box.isEmpty){
      settingHive = SettingHive(themeMode: 'light', language: 'vi', splash: true);
      _box.add(settingHive);
    }else{
      settingHive = _box.getAt(0)!;
    }
    print(settingHive.splash);
  }

  static update({SettingHive? data}){
    _box.putAt(0, data!);
  }
}