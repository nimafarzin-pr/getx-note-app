import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class Snack {
  showSnackBar(String title, String description) {
    Get.closeAllSnackbars();
    Get.snackbar(
      "Error",
      "Please add title",
      icon: const Icon(
        Icons.error,
        color: Colors.white,
        size: 30,
      ),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.yellow[800],
      borderRadius: 20,
      margin: const EdgeInsets.all(15),
      colorText: Colors.white,
      duration: const Duration(seconds: 2),
      isDismissible: true,
      forwardAnimationCurve: Curves.easeOutBack,
    );
  }
}
