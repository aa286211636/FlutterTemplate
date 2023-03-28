import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../pages/login/login.dart';
import '../pages/tabs.dart';
import '../pages/example/sliver.dart';

final storage = GetStorage();

class AppRoute {
  static final routes = [
    GetPage(name: '/', page: () => Tabs()),
    GetPage(name: '/login', page: () => LoginPage()),
    GetPage(name: '/sliver', page: () => SliverPage()),
  ];
}
