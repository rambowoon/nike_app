import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nike/providers/setting_provider.dart';
import 'package:nike/setting_language.dart';
import '../widgets/app_bar.dart';

class SettingScreen extends ConsumerWidget {
  final textShow = "Con cò bay lả bay la";

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Scaffold(
      appBar: buildAppBar('Setting', true, true),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(ngonngu(context).trangchu),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: (){
                    ref.read(settingProvider.notifier).changeThemeMode('light');
                  },
                  child: Icon(
                    Icons.light_mode,
                  ),
                ),
                SizedBox(width: 5,),
                ElevatedButton(
                    onPressed: (){
                      ref.read(settingProvider.notifier).changeThemeMode('dark');
                    },
                    child: Icon(
                      Icons.dark_mode,
                    )
                ),
                SizedBox(width: 5,),
                ElevatedButton(
                    onPressed: (){
                      ref.read(settingProvider.notifier).changeThemeMode('system');
                    },
                    child: Icon(
                      Icons.auto_mode,
                    )
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: (){
                    ref.read(languageProvider.notifier).changeLanguage('vi');
                  },
                  child: Text(
                    "Tiếng Việt"
                  ),
                ),
                SizedBox(width: 5,),
                ElevatedButton(
                    onPressed: (){
                      ref.read(languageProvider.notifier).changeLanguage('en');
                    },
                    child: Text(
                      "Tiếng Anh"
                    )
                ),
              ],
            ),
            ElevatedButton(
                onPressed: (){
                  ref.read(splashProvider.notifier).changeSplash(true);
                },
                child: Text(
                    "Reset Splash"
                )
            )
          ],
        ),
      )
    );
  }
}