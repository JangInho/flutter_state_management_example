import 'package:get/get.dart';

class GetBuilderController extends GetxController {
  int count = 0;

  void increase({String? id}) {
    count++;
    /// id 를 list로 넣을 수 있다.
    id != null ? update([id]) : update();
  }

}