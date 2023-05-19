import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../constants.dart';
import '../../../screens/home/body.dart';
import '../widgets/bottom_tab.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(),
      bottomNavigationBar: BottomTab(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Text('Explore',style: const TextStyle(color: kTextColor,fontSize: 30),),
      centerTitle: true,
      backgroundColor: kBackgroundColor,
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset("assets/icons/hamburger.svg"),
        onPressed: () {},
      ),
      actions: [
        CircleAvatar(
          radius: 30,
          backgroundColor: Colors.white,
          child: IconButton(
            onPressed: () {},
            icon: SvgPicture.asset("assets/icons/bag-2.svg"),
          ),
        ),
      ],
    );
  }
}
