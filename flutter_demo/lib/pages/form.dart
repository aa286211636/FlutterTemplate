import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import '../base/httputil.dart';
import '../base/urls.dart';
import '../pages/employee_model.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final List dataArr = [];
  late int pageNum;
  late int pageSize;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageNum = 1;
    pageSize = 20;
    _getList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('员工列表'),
      ),
      body: ListView.builder(
        itemCount: dataArr.length,
        itemBuilder: (BuildContext context, int index) {
          return Text('data');
        },
      ),
    );
  }

  _getList() async {
    var response = await HttpUtil().post(APIURL.BasicInfomationUrl,data: {
      'pageNum':pageNum,
      'pageSize':pageSize
    });
    var jsonStr = json.decode(response.toString());
    var entity = EmployeeModel.fromJson(jsonStr);
    if (entity.code == 0) {
    } else {
      Fluttertoast.showToast(msg: entity.msg);
    }
  }
}
