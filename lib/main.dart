import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:nike/adapters/cart_hive.dart';
import 'constants.dart';
import 'screens/home/home_screen.dart';

Future main() async{
  await Hive.initFlutter();
  Hive.registerAdapter(CartHiveAdapter());
  await Hive.openBox<CartHive>('cart');
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nike',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor)
      ),
      home: HomeScreen(),
    );
  }
}