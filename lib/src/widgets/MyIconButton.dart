import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyIconButton extends StatelessWidget {
  final color;
  final icon;
  final Function() action;
  const MyIconButton({
    Key? key,
    required this.action,
    this.color,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: SizedBox(
        width: 60.sp,
        height: 60.sp,
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: const Color.fromRGBO(52, 58, 64, 0.5),
            primary: Colors.white,
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          onPressed: () {
            action();
          },
          child: Icon(
            icon,
            color: color,
            size: 24.sp,
          ),
        ),
      ),
    );
  }
}
