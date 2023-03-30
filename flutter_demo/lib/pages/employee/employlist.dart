import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../common/apiurls.dart';
import '../../common/httputil.dart';
import '../../pages/employee/employee_model.dart';

class EmployeeListPage extends StatefulWidget {
  const EmployeeListPage({super.key});

  @override
  State<EmployeeListPage> createState() => _EmployeeListPageState();
}

class _EmployeeListPageState extends State<EmployeeListPage> {
  final List dataArr = [];
  late int pageNum;
  late int pageSize;

  @override
  void initState() {
    super.initState();
    pageNum = 1;
    pageSize = 20;
    _getList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('列表'.tr),
      ),
      body: ListView.builder(
        itemCount: dataArr.length,
        itemBuilder: (BuildContext context, int index) {
          return const Text('data');
        },
      ),
    );
  }

  _getList() async {
    var response = await HttpUtil().post(APIURL.basicInfomationUrl,
        data: {'pageNum': pageNum, 'pageSize': pageSize});
    var jsonStr = json.decode(response.toString());
    var entity = EmployeeModel.fromJson(jsonStr);
    if (entity.code == 0) {
    } else {
      Fluttertoast.showToast(msg: entity.msg);
    }
  }
}
