import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:nike/adapters/cart_hive.dart';
import 'package:nike/adapters/setting_hive.dart';
import 'package:nike/app_init.dart';
import 'package:nike/providers/setting_provider.dart';
import 'package:nike/screens/cart/cart_screen.dart';
import 'package:nike/screens/favorite/favorite_screen.dart';
import 'package:nike/screens/setting/setting_screen.dart';
import 'package:nike/screens/widgets/scaffold_with_nav_bar.dart';
import 'package:nike/setting_language.dart';
import 'app_theme.dart';
import 'screens/home/home_screen.dart';
import 'screens/news/news_screen.dart';
import 'screens/splash/splash_screen.dart';

Future main() async{
  await Hive.initFlutter();
  Hive.registerAdapter(CartHiveAdapter());
  Hive.registerAdapter(SettingHiveAdapter());
  await Hive.openBox<CartHive>('cart');
  await Hive.openBox<SettingHive>('setting');
  await Hive.openBox('favorite_products');
  await AppInit.settup();
  runApp(ProviderScope(child: MyApp()));
}

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final _router = GoRouter(
  initialLocation: '/splash',
  navigatorKey: _rootNavigatorKey,
  routes: [
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) {
        return ScaffoldWithNavBar(child: child);
      },
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) {
            return const HomeScreen();
          },
        ),
        GoRoute(
          path: '/cart',
          builder: (context, state) {
            return CartScreen();
          },
        ),
        GoRoute(
          path: '/yeuthich',
          builder: (context, state) {
            return FavoriteScreen();
          },
        ),
        GoRoute(
          path: '/tintuc',
          builder: (context, state) {
            return NewsScreen();
          },
        ),
        GoRoute(
          path: '/setting',
          builder: (context, state) {
            return SettingScreen();
          }
        ),
      ],
    ),
    GoRoute(
      path: '/splash',
      builder: (context, state) {
        return SplashScreen();
      },
    ),
  ],
);

class MyApp extends ConsumerWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(settingProvider);
    final languageMode = ref.watch(languageProvider);
    return MaterialApp.router(
      title: 'Nike',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: themeMode,
      localizationsDelegates: NDSharedLanguage().localeDelegate,
      supportedLocales: NDSharedLanguage().supportedLocales,
      locale: languageMode,
      routerConfig: _router,
    );
  }
}