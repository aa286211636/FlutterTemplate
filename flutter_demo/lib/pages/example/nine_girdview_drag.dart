import 'package:flutter/material.dart';
import 'package:nine_grid_view/nine_grid_view.dart';
import 'nine_girdview_model.dart';
import 'nine_girdview_util.dart';
import 'package:get/get.dart';

class NineGirdviewDragPage extends StatefulWidget {
  const NineGirdviewDragPage({super.key});

  @override
  State<NineGirdviewDragPage> createState() => _NineGirdviewDragPageState();
}

class _NineGirdviewDragPageState extends State<NineGirdviewDragPage> {
  List<ImageBean> imageList = [];
  int moveAction = MotionEvent.actionUp;
  bool _canDelete = false;

  @override
  void initState() {
    super.initState();
    _init();
  }

  void _init() {
    imageList = NineGirdviewUtil.getTestData();
  }

  void _loadAssets(BuildContext context) {
    // pick Images.
    Get.snackbar('提示'.tr, '请选择图片'.tr);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DragSortView'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
              icon:const Icon(Icons.refresh),
              onPressed: () {
                setState(() {
                  _init();
                });
              }),
        ],
      ),
      body: ListView(
        children: <Widget>[
          ListTile(title: Text('提示:长按进行拖拽'.tr),leading: const Icon(Icons.tips_and_updates),),
          DragSortView(
            imageList,
            space: 5,
            margin: const EdgeInsets.all(10),
            padding:const EdgeInsets.all(0),
            itemBuilder: (BuildContext context, int index) {
              ImageBean bean = imageList[index];
              // It is recommended to use a thumbnail picture
              return NineGirdviewUtil.getWidget(bean.thumbPath!);
            },
            initBuilder: (BuildContext context) {
              return InkWell(
                onTap: () {
                  _loadAssets(context);
                },
                child: Container(
                  color:const Color(0XFFCCCCCC),
                  child:const Center(
                    child:Icon(
                      Icons.add,
                    ),
                  ),
                ),
              );
            },
            onDragListener: (MotionEvent event, double itemWidth) {
              switch (event.action) {
                case MotionEvent.actionDown:
                  moveAction = event.action!;
                  setState(() {});
                  break;
                case MotionEvent.actionMove:
                  double x = event.globalX! + itemWidth;
                  double y = event.globalY! + itemWidth;
                  double maxX = MediaQuery.of(context).size.width - 1 * 100;
                  double maxY = MediaQuery.of(context).size.height - 1 * 100;
                  if (_canDelete && (x < maxX || y < maxY)) {
                    setState(() {
                      _canDelete = false;
                    });
                  } else if (!_canDelete && x > maxX && y > maxY) {
                    setState(() {
                      _canDelete = true;
                    });
                  }
                  break;
                case MotionEvent.actionUp:
                  moveAction = event.action!;
                  if (_canDelete) {
                    setState(() {
                      _canDelete = false;
                    });
                    return true;
                  } else {
                    setState(() {});
                  }
                  break;
              }
              return false;
            },
          ),
        ],
      ),
      floatingActionButton: moveAction == MotionEvent.actionUp
          ? null
          : FloatingActionButton(
              onPressed: () {},
              child: Icon(_canDelete ? Icons.delete : Icons.delete_outline),
            ),
    );
  }
}
