import 'package:fl_ui_app/src/screens/items/NoteItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:fl_ui_app/src/controller/NoteController.dart';
import 'package:fl_ui_app/src/widgets/MyButtonSheet.dart';
import 'package:fl_ui_app/src/widgets/MyIconButton.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with RouteAware, WidgetsBindingObserver {
  var height = 0.0;
  var width = 0.0;
  var color = Colors.black;

  _updateSize() {
    setState(() {
      height = 180.r;
      width = 180.r;
      color = Colors.white;
    });
  }

  _navigatorAction(act, screen) {
    if (act == 'push') {
      //!for splash screen we can use off/offName instead to and then we cant back
      Get.toNamed(screen);
    } else {
      Get.back();
    }
  }

  @override
  void initState() {
    super.initState();
    print('initState');
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    super.dispose();
    print('dispose');
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      print('resume');
    } else if (state == AppLifecycleState.inactive) {
      print('inactive');
    } else if (state == AppLifecycleState.paused) {
      print('paused');
    } else if (state == AppLifecycleState.detached) {
      print('detached');
    }
  }

  @override
  void didUpdateWidget(covariant HomeScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('didUpdateWidget');
  }

  final NoteController controller = Get.find<NoteController>();
  @override
  Widget build(BuildContext context) {
    // _updateSize();
    return Scaffold(
      backgroundColor: const Color.fromRGBO(0, 0, 0, 1),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(12.w, 10.w, 12.w, 6.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                // color: Colors.blue,
              ),
              // height: 10.h,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  UnconstrainedBox(
                    child: FittedBox(
                      child: Text(
                        'Notes',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 34.sp,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        MyIconButton(
                          action: () {
                            // apiService.doSome();
                            _navigatorAction('push', '/search');
                          },
                          color: Colors.white,
                          icon: Icons.search,
                        ),
                        SizedBox(
                          width: 12.w,
                        ),
                        const MyModalBottomButton(
                          description:
                              'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is',
                          title: 'Info',
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: GetX<NoteController>(
                builder: (_) {
                  return Container(
                    child: controller.noteLists.isNotEmpty
                        ? ListView.builder(
                            shrinkWrap: true,
                            addRepaintBoundaries: true,
                            itemCount: controller.noteLists.length,
                            itemBuilder: (BuildContext context, int index) {
                              final item = controller.noteLists[index];
                              return NoteItem(
                                  index: index,
                                  controller: controller,
                                  item: item);
                            },
                          )
                        : SizedBox(
                            height: double.infinity,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                AnimatedContainer(
                                  width: 150.w,
                                  height: 150.w,
                                  curve: Curves.slowMiddle,
                                  duration: const Duration(milliseconds: 500),
                                  margin: EdgeInsets.only(bottom: 12.w),
                                  child: Image.asset('assets/images/notes.png',
                                      color: Colors.white),
                                ),
                                Text(
                                  'Create your frist Note!',
                                  style: TextStyle(
                                      fontSize: 24.sp, color: Colors.white),
                                )
                              ],
                            ),
                          ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        width: 60.sp,
        height: 60.sp,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
        child: FloatingActionButton(
          onPressed: () {
            _navigatorAction('push', '/add');
            // _updateSize();
          },
          // tooltip: 'Increment',
          child: Icon(
            Icons.add,
            size: 32.sp,
          ),
          foregroundColor: Colors.white,
          backgroundColor: const Color.fromRGBO(52, 58, 64, 0.5),
        ),
      ),
    );
  }
}
