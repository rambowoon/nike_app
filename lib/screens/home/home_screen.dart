import 'package:flutter/material.dart';
import '../../../screens/home/body.dart';
import '../widgets/app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar('Explore',true, true),
      body: Body(),
    );
  }
}