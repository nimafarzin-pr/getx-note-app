// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';

class Note {
  String title;
  String description;
  Color color;
  String time;
  String id;

  Note(
      {this.title = '',
      this.id = '',
      this.description = '',
      this.time = '',
      this.color = const Color.fromRGBO(255, 255, 255, 1)});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'description': description,
      'color': color.value,
      'time': time,
      'id': id,
    };
  }

  String toJson() => json.encode(toMap());
}
