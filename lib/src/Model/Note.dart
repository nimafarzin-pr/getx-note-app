import 'package:flutter/material.dart';

class Note {
  String title;
  String description;
  Color color;
  String time;

  Note(
      {this.title = '',
      this.description = '',
      this.time = '',
      this.color = const Color.fromRGBO(255, 255, 255, 1)});
}
