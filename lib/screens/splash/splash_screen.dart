import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nike/providers/setting_provider.dart';

class SplashScreen extends ConsumerWidget {

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final splash = ref.watch(splashProvider);
    if(splash == true){
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Đây là trang splash'),
              SizedBox(height: 10,),
              ElevatedButton(
                  onPressed: (){
                    ref.read(splashProvider.notifier).changeSplash(false);
                    context.go("/");
                  },
                  child: Text("Bắt đầu")
              )
            ],
          ),
        ),
      );
    }else{
      WidgetsBinding.instance!.addPostFrameCallback((_) {
        context.go("/");
      });
      return Scaffold();
    }
  }
}