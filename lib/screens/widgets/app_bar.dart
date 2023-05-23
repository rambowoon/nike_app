import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../constants.dart';
import '../../providers/cart_provider.dart';

AppBar buildAppBar(String title, bool home, bool cart) {
  return AppBar(
    title: Text(title,style: const TextStyle(fontSize: 30),),
    centerTitle: true,
    elevation: 0,
    leading: Builder(
      builder: (BuildContext context) {
        return (home) ? IconButton(
          icon: Icon(Icons.menu),
          onPressed: () { Scaffold.of(context).openDrawer(); },
          tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
        ) : const BackButton(color: kPrimaryColor,);
      },
    ),
    actions: [
      if(cart == true)
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
                  onPressed: () {context.push("/cart");},
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