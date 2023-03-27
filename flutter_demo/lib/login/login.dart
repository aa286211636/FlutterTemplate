import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../common/urls.dart';
import '../common/httputil.dart';
import 'package:flutter_demo/login/loginmodel.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _accountController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _connect = GetConnect();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _accountController,
              decoration: InputDecoration(
                labelText: '请输入账号',
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: '请输入密码'),
            ),
            SizedBox(height: 40),
            Container(
              width: Get.width * 0.8,
              height: 50,
              child: ElevatedButton(
                  onPressed: () {
                    _checkTextFlied(
                        _accountController.text, _passwordController.text);
                  },
                  child: Text('登录')),
            )
          ],
        ),
      ),
    );
  }

  _checkTextFlied(String accountStr, String passwordStr) {
    if (accountStr.isEmpty) {
      Fluttertoast.showToast(msg: '账号不能为空');
    } else if (passwordStr.isEmpty) {
      Fluttertoast.showToast(msg: '密码不能为空');
    } else {
      _loginRequest(accountStr, passwordStr);
    }
  }

  _loginRequest(String accountStr, String passwordStr) async {
    var response = await HttpUtil().post(APIURL.LoginUrl,
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
