import 'package:get/get.dart';
class Language extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'zh_CN': {
           '英文': '英文',
           '登录': '登录',
           '退出登录': '退出登录',
           '请输入账号': '请输入账号',
           '请输入密码': '请输入密码',
           '账号不能为空': '账号不能为空',
           '密码不能为空': '密码不能为空',
           '夜间模式切换':'夜间模式切换',
           '中英文切换':'中英文切换',
           '列表':'列表',
           '通讯录':'通讯录',
           '我的':'我的',



        },
        'en_US': {
           '英文': 'english',
           '登录': 'Login',
           '退出登录': 'Sign out',
           '请输入账号': 'Please enter the account number',
           '请输入密码': 'Please enter a password',
           '账号不能为空': 'Account cannot be empty',
           '密码不能为空': 'Password cannot be empty',
           '夜间模式切换':'Night mode switching',
           '中英文切换':'zh_CN/en_US switching',
           '列表':'List',
           '通讯录':'Addressbook',
           '我的':'Personal',
        },
  };
}