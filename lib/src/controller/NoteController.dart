import 'package:fl_ui_app/src/Model/Note.dart';
import 'package:get/get.dart';

//state managment with getx => .obs //!for save ram this better
class NoteController extends GetxController {
  RxList<Note> noteLists = <Note>[].obs;
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

  addNoteToList(Note note) {
    noteLists.add(note);
  }

  updateNote(Note item, id) {
    Note updateNote = noteLists.firstWhere((element) => element.id == id);
    updateNote.time = item.time;
    updateNote.title = item.title;
    updateNote.description = item.description;
    noteLists.refresh();
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
