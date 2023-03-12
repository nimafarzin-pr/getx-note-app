import 'dart:math';

import 'package:flutter/material.dart';

import 'package:fl_ui_app/src/widgets/MyIconButton.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyModalBottomButton extends StatefulWidget {
  final String title;
  final String description;
  const MyModalBottomButton({
    Key? key,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  ModalBottomSheetDemo createState() => ModalBottomSheetDemo();
}

class ModalBottomSheetDemo extends State<MyModalBottomButton>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late final Animation<double> _animation;

  @override
  initState() {
    controller = BottomSheet.createAnimationController(this);
    controller.duration = const Duration(milliseconds: 900);
    _animation = CurvedAnimation(
      reverseCurve: Curves.bounceIn,
      parent: controller,
      curve: Curves.slowMiddle,
    );
    controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MyIconButton(
      action: () {
        showModalBottomSheet<void>(
          transitionAnimationController: controller,
          backgroundColor: const Color.fromRGBO(52, 58, 64, 1),
          context: context,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
          builder: (BuildContext context) {
            return AnimatedBuilder(
              animation: controller.view,
              builder: (context, child) {
                return Transform.rotate(
                    angle: controller.value * 2 * pi, child: child);
              },
              child: ScaleTransition(
                scale: _animation,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                      title: Text(widget.title,
                          style:
                              TextStyle(fontSize: 24.sp, color: Colors.white)),
                    ),
                    Padding(
                      padding: EdgeInsets.all(12.w),
                      child: Text(
                        widget.description,
                        style: TextStyle(fontSize: 14.sp, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
      color: Colors.white,
      icon: Icons.info_outline,
    );
  }
}
