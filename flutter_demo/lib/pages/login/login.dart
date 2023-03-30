import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../common/apiurls.dart';
import '../../common/httputil.dart';
import '../login/loginmodel.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _accountController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _accountController,
              decoration: InputDecoration(
                labelText: '请输入账号'.tr,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: '请输入密码'.tr),
            ),
            const SizedBox(height: 40),
            SizedBox(
              width: Get.width * 0.8,
              height: 50,
              child: ElevatedButton(
                  onPressed: () {
                    _checkTextFlied(
                        _accountController.text, _passwordController.text);
                  },
                  child: Text('登录'.tr)),
            )
          ],
        ),
      ),
    );
  }

  _checkTextFlied(String accountStr, String passwordStr) {
    if (accountStr.isEmpty) {
      Fluttertoast.showToast(msg: '账号不能为空'.tr);
    } else if (passwordStr.isEmpty) {
      Fluttertoast.showToast(msg: '密码不能为空'.tr);
    } else {
      _loginRequest(accountStr, passwordStr);
    }
  }

  _loginRequest(String accountStr, String passwordStr) async {
    var response = await HttpUtil().post(APIURL.loginUrl,
        data: {'username': accountStr, 'password': passwordStr});
    var loginMap = json.decode(response.toString());
    var entity = loginmodel.fromJson(loginMap);
    if (entity.code == 200) {
      GetStorage box = GetStorage();
      box.write("access_token", entity.data.accessToken);
      Get.offAllNamed('/');
    } else {}
  }
}
