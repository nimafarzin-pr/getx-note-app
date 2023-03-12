import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyTextFeild extends StatelessWidget {
  final String hint;
  final hint_color;
  final icon;
  final min_line_number;
  final max_line_number;
  final multiline;
  final controller;
  final fontSize;
  final anim;
  final animController;

  final Function(String) setText;

  const MyTextFeild(
      {Key? key,
      required this.hint,
      this.hint_color,
      this.icon,
      this.max_line_number,
      this.min_line_number,
      this.multiline,
      required this.setText,
      this.controller,
      this.fontSize,
      required this.anim,
      this.animController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Center(
        child: SizedBox(
          child: TextField(
              controller: controller,
              keyboardType: multiline,
              maxLines: max_line_number,
              minLines: min_line_number,
              onChanged: (text) {
                setText(text);
              },
              style: TextStyle(fontSize: fontSize, color: Colors.white),
              decoration: anim == true
                  ? InputDecoration(
                      prefixIcon: Container(
                        child: AnimatedBuilder(
                          animation: animController.view,
                          builder: (context, child) {
                            return Transform.rotate(
                                angle: animController.value * 2 * pi,
                                child: child);
                          },
                          child: Icon(
                            icon,
                            color: hint_color,
                            size: fontSize,
                          ),
                        ),
                      ),
                      hintText: hint,
                      hintStyle:
                          TextStyle(color: hint_color, fontSize: fontSize),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 16.sp, horizontal: 16.sp),
                      border: const OutlineInputBorder(
                          // width: 0.0 produces a thin "hairline" border
                          borderRadius: BorderRadius.all(Radius.circular(12.0)),
                          borderSide: BorderSide(
                              style: BorderStyle.solid, color: Colors.white)
                          //borderSide: const BorderSide(),
                          ),
                    )
                  : InputDecoration(
                      prefixIcon: Icon(
                        icon,
                        color: hint_color,
                        size: fontSize,
                      ),
                      hintText: hint,
                      hintStyle:
                          TextStyle(color: hint_color, fontSize: fontSize),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 16.sp, horizontal: 16.sp),
                      border: const OutlineInputBorder(
                          // width: 0.0 produces a thin "hairline" border
                          borderRadius: BorderRadius.all(Radius.circular(12.0)),
                          borderSide: BorderSide(
                              style: BorderStyle.solid, color: Colors.white)
                          //borderSide: const BorderSide(),
                          ),
                    )),
        ),
      ),
    );
  }
}
