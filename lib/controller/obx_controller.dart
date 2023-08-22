import 'package:get/get.dart';

/// 단순히 Rx만 사용한다면 GetXController 상속 없어도된다.
/// ever, once, debounce, interval을 사용하려면 GetXController 상속해야한다.
class ObxController extends GetxController {

  RxInt count = 0.obs;

  /// 커스텀 Rx
  /// 그 동안 원시타입을 제외한 클래스나, 이넘같은 것들은 어떻게 obx를 적용할까를 생각했는데,
  Rx<NUM> num = NUM.FIRST.obs;
  /// num(NUM.SECOND); // 이렇게 사용할 수 있다.
  Rx<User> user1 = User(name: 'name', age: 10).obs;
  /// user1(User(name: 'name', age: 10)); // 이렇게 사용할 수 있다.
  /// user1.update((_user) {_user.name = 'name2'; _user.age = 20;}); // 이렇게 사용할 수 있다.
  RxList<String> list = <String>[].obs;
  /// list.add('test'); // 이렇게 사용할 수 있다.
  /// list.addAll(['test1', 'test2']); // 이렇게 사용할 수 있다.
  /// list.addIf(condition, 'test3' ); // 이렇게 사용할 수 있다.

  @override
  void onInit() {
    /// obx는 이벤트를 사용할 수 있다.
    ever(count, (callback) => print('매번 호출'));
    once(count, (callback) => print('한번만 호출'));
    /// 검색 기능에 많이 사용한다.
    debounce(count, (callback) => print('마지막 변경에 한번만 호출'), time: const Duration(seconds: 1));
    /// 언제 사용할까 이 친구는
    interval(count, (callback) => print('변경되고 있는 동안 1초마다 호출'), time: const Duration(seconds: 1));

    super.onInit();
  }

  void increase() {
    count++;
  }

  void putNumber(int number) {
    count(number);
  }

}

enum NUM {
  FIRST, SECOND
}

class User {
  String name;
  int age;
  User({required this.name, required this.age});
}