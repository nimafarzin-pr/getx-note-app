import 'dart:math';

import 'package:fl_ui_app/src/controller/NoteController.dart';
import 'package:fl_ui_app/src/widgets/MyTextFeild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/instance_manager.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen>
    with TickerProviderStateMixin {
  final List<String> searchItems = <String>[''];
  //*use dependency with getx
  // final useDependency = Get.find<Api>();
  final controller = Get.find<NoteController>();
  late AnimationController animatedController;
  late final Animation<double> _animation;
  var searchText = '';

  @override
  initState() {
    print('in Search');
    animatedController = BottomSheet.createAnimationController(this);
    animatedController.duration = const Duration(milliseconds: 900);
    _animation = CurvedAnimation(
      reverseCurve: Curves.bounceIn,
      parent: animatedController,
      curve: Curves.slowMiddle,
    );
    animatedController.repeat();
    super.initState();
  }

  @override
  void dispose() {
    animatedController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(0, 0, 0, 1),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: SafeArea(
          child: Container(
            margin: EdgeInsets.fromLTRB(12.w, 12.w, 12.w, 0),
            child: Column(
              children: [
                MyTextFeild(
                  animController: animatedController,
                  anim: searchText.isNotEmpty ? true : false,
                  max_line_number: 1,
                  fontSize: 20.sp,
                  multiline: TextInputType.text,
                  icon: Icons.search,
                  hint_color: Colors.white54,
                  hint: 'Search Somthing...',
                  setText: (value) {
                    setState(() {
                      searchText = value;
                    });
                    // print('>>>${controller.title}');
                    if (value.isNotEmpty) {
                      animatedController.repeat();
                    } else {
                      animatedController.forward();
                    }
                  },
                ),
                Expanded(
                  child: Container(
                    color: Colors.black,
                    width: 100.sw,
                    height: double.infinity,
                    child: UnconstrainedBox(
                      child: Container(
                        width: 150.r,
                        height: 150.r,
                        margin: EdgeInsets.only(bottom: 12.w),
                        child: Image.asset('assets/images/notes.png',
                            color: Colors.white38),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
