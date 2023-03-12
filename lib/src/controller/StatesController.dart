import 'package:get/get.dart';

//state managment with getx => not observable
class MyStates extends GetxController {
  String title = '';
  String description = '';
  List<String> notes = [];

  void setTitle(String data) {
    title = data;
  }

  addNote(data) {
    notes.add(data);
    update();
  }

  deleteNote(index) {
    notes.remove(index);
  }
}
