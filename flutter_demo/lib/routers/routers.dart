import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../pages/login/login.dart';
import '../pages/tabs.dart';
import '../pages/example/sliver.dart';
import '../pages/example/citylist.dart';
import '../pages/example/nine_girdview.dart';
import '../pages/example/nine_girdview_drag.dart';

final storage = GetStorage();

class AppRoute {
  static final routes = [
    GetPage(name: '/', page: () => const Tabs()),
    GetPage(name: '/login', page: () => const LoginPage()),
    GetPage(name: '/sliver', page: () => const SliverPage()),
    GetPage(name: '/citylist', page: () => CityListPage()),
    GetPage(name: '/ninegirdview', page: () =>const NineGirdviewPage()),
    GetPage(name: '/ninegirddragview', page: () =>const NineGirdviewDragPage()),
  ];
}
