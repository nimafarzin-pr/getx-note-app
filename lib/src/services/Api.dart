import 'package:get/get.dart';

class Api extends GetConnect {
  Future<List<dynamic>> getData() async {
    final response = await get('https://randomuser.me/api/');
    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      //do somthing with data
      return response.body['results'];
    }
  }
}
