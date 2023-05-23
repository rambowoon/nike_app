import 'package:flutter/material.dart';
import '../../../screens/home/body.dart';
import '../widgets/app_bar.dart';
import '../widgets/bottom_tab.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar('Explore',true, true),
      body: Body(),
      bottomNavigationBar: const BottomTab(),
    );
  }
}
