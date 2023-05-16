import 'package:fl_ui_app/src/Model/Note.dart';
import 'package:fl_ui_app/src/controller/NoteController.dart';
import 'package:fl_ui_app/src/utils/Snack.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:fl_ui_app/src/widgets/MyIconButton.dart';
import 'package:fl_ui_app/src/widgets/MyTextFeild.dart';
import 'dart:math' as math;
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

import '../widgets/MyButtonSheet.dart';

class AddNoteScreen extends StatefulWidget {
  const AddNoteScreen({Key? key}) : super(key: key);

  @override
  State<AddNoteScreen> createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();
  final NoteController controller = Get.find<NoteController>();
  var navigationData;

  @override
  void initState() {
    super.initState();
    setState(() {
      var data = Get.arguments;
      if (data != null && data[0] == false) {
        final note = data[1] as Note;
        navigationData = note;
        title.text = note.title;
        description.text = note.description;
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    title.dispose();
    description.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color.fromRGBO(0, 0, 0, 1),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: SafeArea(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(12.w, 10.w, 12.w, 0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  // color: Colors.amberAccent,
                ),
                // height: 10.h,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    MyIconButton(
                      action: () {
                        Get.back();
                      },
                      color: Colors.white,
                      icon: Icons.arrow_back_ios_new,
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          MyModalBottomButton(
                            icon: Icons.visibility,
                            description: description.text,
                            title: title.text,
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          MyIconButton(
                            action: () {
                              if (title.text.isNotEmpty &&
                                  description.text.isNotEmpty) {
                                var now = DateTime.now();
                                var formatterDate = DateFormat(
                                  'yyyy-MM-dd',
                                );
                                String actualDate = formatterDate.format(now);
                                if (navigationData != null) {
                                  final data = navigationData as Note;

                                  controller.updateNote(
                                      Note(
                                          color: data.color,
                                          description: description.text,
                                          title: title.text,
                                          time: actualDate),
                                      data.id);
                                } else {
                                  controller.addNoteToList(Note(
                                      title: title.text,
                                      description: description.text,
                                      color: Color((math.Random().nextDouble() *
                                                  0xFFFFFF)
                                              .toInt())
                                          .withOpacity(1.0),
                                      time: actualDate,
                                      id: const Uuid().v4()));
                                }
                                Get.back(result: true);
                              } else {
                                Snack().showSnackBar(
                                    'Error', 'Please enter title');
                              }
                            },
                            color: Colors.white,
                            icon: Icons.save,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.fromLTRB(12.w, 12.w, 12.w, 0),
                  child: Column(
                    children: [
                      MyTextFeild(
                        anim: false,
                        controller: title,
                        fontSize: 30.sp,
                        multiline: TextInputType.text,
                        icon: Icons.title,
                        max_line_number: 1,
                        hint_color: Colors.white54,
                        hint: 'Add your title',
                        setText: (p0) {
                          setState(() {});
                        },
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      MyTextFeild(
                        anim: false,
                        fontSize: 20.sp,
                        min_line_number: 1,
                        max_line_number: 4,
                        controller: description,
                        multiline: TextInputType.multiline,
                        icon: Icons.description,
                        hint_color: Colors.white54,
                        hint: 'Add your description',
                        setText: (p0) {
                          setState(() {});
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
