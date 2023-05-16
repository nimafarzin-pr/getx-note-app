import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:fl_ui_app/src/controller/NoteController.dart';
import 'package:fl_ui_app/src/widgets/MyTextFeild.dart';

import '../Model/Note.dart';
import 'items/NoteItem.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen>
    with TickerProviderStateMixin {
  //*use dependency with getx
  List<Note> searchItems = <Note>[];
  // final useDependency = Get.find<Api>();
  final controller = Get.find<NoteController>();
  late AnimationController animatedController;
  TextEditingController searchText = TextEditingController(text: "");

  @override
  initState() {
    searchItems = List.from(controller.noteLists);
    animatedController = BottomSheet.createAnimationController(this);
    animatedController.duration = const Duration(milliseconds: 900);

    // animatedController.repeat();
    super.initState();
  }

  @override
  void dispose() {
    animatedController.dispose();
    searchText.dispose();
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
                  anim: searchText.text.isNotEmpty ? true : false,
                  max_line_number: 1,
                  fontSize: 20.sp,
                  controller: searchText,
                  multiline: TextInputType.text,
                  icon: Icons.search,
                  hint_color: Colors.white54,
                  hint: 'Search Somthing...',
                  setText: (value) {
                    searchItems.clear();
                    if (value.isEmpty) {
                      animatedController.forward();
                      setState(() {
                        searchItems.addAll(controller.noteLists);
                      });
                      return;
                    }
                    animatedController.repeat();
                    for (var element in controller.noteLists) {
                      if (element.toMap().values.toString().contains(value)) {
                        searchItems.add(element);
                      }
                    }

                    setState(() {});
                  },
                ),
                Expanded(
                  child: Container(
                    color: Colors.black,
                    width: 100.sw,
                    height: double.infinity,
                    child: searchItems.isNotEmpty
                        ? ListView.builder(
                            shrinkWrap: true,
                            addRepaintBoundaries: true,
                            itemCount: searchItems.length,
                            itemBuilder: (BuildContext context, int index) {
                              final item = searchItems[index];
                              return NoteItem(
                                  isDismissable: false,
                                  onTap: () {
                                    searchText.clear();
                                    setState(() {});
                                    Get.toNamed('/add',
                                            arguments: [false, item])
                                        ?.then((value) {
                                      if (value) {
                                        setState(() {
                                          searchItems =
                                              List.from(controller.noteLists);
                                        });
                                      }
                                    });
                                  },
                                  index: index,
                                  controller: controller,
                                  item: item);
                            },
                          )
                        : UnconstrainedBox(
                            child: Container(
                              width: 150.r,
                              height: 150.r,
                              margin: EdgeInsets.only(bottom: 12.w),
                              child: Image.asset('assets/images/search.png',
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
