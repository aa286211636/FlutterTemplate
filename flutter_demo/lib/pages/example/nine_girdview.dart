
import 'package:flutter/material.dart';
import 'package:nine_grid_view/nine_grid_view.dart';
import 'nine_girdview_model.dart';
import 'nine_girdview_util.dart';
import 'package:get/get.dart';

class NineGirdviewPage extends StatefulWidget {
  const NineGirdviewPage({super.key});

  @override
  State<NineGirdviewPage> createState() => _NineGirdviewPageState();
}

class _NineGirdviewPageState extends State<NineGirdviewPage> {
  List<ImageBean> imageDatalist = [];
  NineGridType _type = NineGridType.qqGp;
  String _title = 'QQ Group';

  @override
  void initState() {
    super.initState();
    imageDatalist = NineGirdviewUtil.getTestData();
  }

  Widget _buildGroup(BuildContext context) {
    BoxDecoration decoration = const BoxDecoration(
        color: Color(0xffe5e5e5),
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.all(Radius.circular(4)));
    int total = 1;
    switch (_type) {
      case NineGridType.qqGp:
        total = 5;
        break;
      case NineGridType.weChatGp:
        total = 9;
        break;
      case NineGridType.dingTalkGp:
        total = 4;
        break;
    }
    List<Widget> children = [];
    for (var i = 0; i < 9; i++) {
      children.add(NineGridView(
          itemCount: i % total + 1,
          type: _type,
          width: (Get.width - 60) / 3,
          height: (Get.width - 60) / 3,
          margin: const EdgeInsets.all(5),
          padding: const EdgeInsets.all(3),
          space: 2,
          decoration: _type == NineGridType.dingTalkGp ? null : decoration,
          itemBuilder: (BuildContext context, int index) {
            ImageBean bean = imageDatalist[index];
            return NineGirdviewUtil.getWidget(bean.originPath!);
          }));
    }
    return Wrap(
      alignment: WrapAlignment.center,
      children: children,
    );
  }

  Widget _buildItem(BuildContext context, int index) {
    int itemCount = index % 9 + 1;
    if (_type == NineGridType.normal ||
        _type == NineGridType.weiBo ||
        _type == NineGridType.weChat) {
      return Container(
        decoration: const BoxDecoration(
            border: Border(
                bottom: BorderSide(width: 0.33, color: Color(0xffe5e5e5)))),
        padding: const EdgeInsets.all(0),
        child: NineGridView(
          margin: const EdgeInsets.all(12),
          padding: const EdgeInsets.all(5),
          space: 5,
          type: _type,
          color: const Color(0XFFE5E5E5),
          itemCount: itemCount,
          itemBuilder: (BuildContext context, int index) {
            ImageBean bean = imageDatalist[index];
            return NineGirdviewUtil.getWidget(bean.middlePath!);
          },
        ),
      );
    } else {
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_title),
          actions: [
            PopupMenuButton(
              icon: const Icon(Icons.settings),
              itemBuilder: (BuildContext context) =>
                  <PopupMenuEntry<NineGridType>>[
                const PopupMenuItem(
                    value: NineGridType.qqGp,
                    child: ListTile(title: Text('QQGroup'))),
                const PopupMenuItem(
                    value: NineGridType.weChatGp,
                    child: ListTile(title: Text('WeChat Group'))),
                const PopupMenuItem(
                    value: NineGridType.dingTalkGp,
                    child: ListTile(title: Text('DingTalk Group'))),
                const PopupMenuItem(
                    value: NineGridType.weChat,
                    child: ListTile(title: Text('WeChat'))),
                const PopupMenuItem(
                    value: NineGridType.weiBo,
                    child: ListTile(title: Text('WeiBo'))),
                const PopupMenuItem(
                    value: NineGridType.normal,
                    child: ListTile(title: Text('Normal'))),
              ],
              onSelected: _onPopSelected,
            )
          ],
        ),
        body: (_type == NineGridType.qqGp ||
                _type == NineGridType.weChatGp ||
                _type == NineGridType.dingTalkGp)
            ? ListView(
                physics: const AlwaysScrollableScrollPhysics(
                    parent: BouncingScrollPhysics()),
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  _buildGroup(context)
                ],
              )
            : ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: 9,
                itemBuilder: (BuildContext context, int index) {
                  return _buildItem(context, index);
                }));
  }

  void _onPopSelected(NineGridType value) {
    print('_onPopSelected...... $value');
    if (_type != value) {
      _type = value;
      switch (value) {
        case NineGridType.qqGp:
          _title = 'QQ Group';
          break;
        case NineGridType.weChatGp:
          _title = 'WeChat Group';
          break;
        case NineGridType.dingTalkGp:
          _title = 'DingTalk Group';
          break;
        case NineGridType.weChat:
          _title = 'WeChat';
          break;
        case NineGridType.weiBo:
          _title = 'WeiBo Intl';
          break;
        case NineGridType.normal:
          _title = 'Normal';
          break;
      }
      setState(() {});
    }
  }
}
