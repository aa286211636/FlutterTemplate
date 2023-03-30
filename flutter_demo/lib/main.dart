import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';
import 'routers/routers.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'common/languages.dart';
void main() async {
  await GetStorage.init();
  runApp(const MyAPP());
}

class MyAPP extends StatelessWidget {
  const MyAPP({super.key});

  @override
  Widget build(BuildContext context) {
    GetStorage box = GetStorage();
    return KeyboardDismissOnTap(
        child: GetMaterialApp(
      initialRoute: box.hasData('access_token') ? '/' : '/login',
      translations: Language(),
      locale: const Locale('zh','CN'),
      fallbackLocale: const Locale('en','US'),
      getPages: AppRoute.routes,
      defaultTransition: Transition.cupertino,
    ));
  }
}
