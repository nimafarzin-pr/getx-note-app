import 'package:fl_ui_app/src/controller/NoteController.dart';
import 'package:fl_ui_app/src/controller/StatesController.dart';
import 'package:fl_ui_app/src/services/Api.dart';
import 'package:get/instance_manager.dart';

class RootBinding extends Bindings {
  @override
  void dependencies() {
    // ignore: todo
    // TODO: implement dependencies
    Get.put(Api());
    Get.put(MyStates());
    Get.lazyPut(() => NoteController());
  }
}
