import 'package:fl_ui_app/src/Model/Note.dart';
import 'package:get/get.dart';

//state managment with getx => .obs //!for save ram this better
class NoteController extends GetxController {
  RxList noteLists = [].obs;
  final note = Note().obs;

  updateTitle(String title) {
    note.update((val) {
      val?.title = title;
    });
  }

  updateDescription(String description) {
    note.update((val) {
      val?.description = description;
    });
  }

  updateNoteList(Note notes) {
    noteLists.add(notes);
  }

  updateTime(String time) {
    note.update((val) {
      val?.time = time;
    });
  }

  removeFromNoteList(int index) {
    noteLists.removeAt(index);
  }
}
