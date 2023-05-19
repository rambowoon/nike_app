import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import '../../../constants.dart';
import '../../../screens/home/body.dart';
import '../../providers/cart_provider.dart';
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
        Consumer(
          builder: (context, WidgetRef ref, _) {
            final cartItems = ref.watch(cartProvider).cartItems;
            final itemCount = cartItems.length;

            return Stack(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  child: IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset("assets/icons/bag-2.svg"),
                  ),
                ),
                if (itemCount > 0)
                  Positioned(
                    right: 0,
                    child: Container(
                      padding: EdgeInsets.all(7),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        itemCount <= 99 ? itemCount.toString() : '99+',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
              ],
            );
          },
        ),
      ],
    );
  }
}
