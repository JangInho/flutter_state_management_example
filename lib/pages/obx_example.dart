import 'package:flutter/material.dart';
import 'package:flutter_state_management_example/controller/obx_controller.dart';
import 'package:get/get.dart';

class ObxExample extends StatelessWidget {

  const ObxExample({super.key});

  @override
  Widget build(BuildContext context) {

    /// 반응형 상태관리

    ObxController obxController = Get.put(ObxController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Obx Example'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() {
              /// 중요! rx 변수의 값이 바껴야 업데이트를 친다.
              /// GetBuilder 값에 상관없이 다 업데이트를 친다
              /// obx를 사용한다면 업데이트하는 횟수를 줄여 성능을 높일 수 있는 상황이 있다.
              print('update');
              return Text(
                '${obxController.count}',
                style: const TextStyle(fontSize: 50),
              );
            }),

            ElevatedButton(
                onPressed: () {
                  obxController.increase();
                },
                child: const Text(
                  '+',
                  style: TextStyle(fontSize: 50),
                )),
            const SizedBox(height: 8),
            ElevatedButton(
                onPressed: () {
                  obxController.putNumber(10);
                },
                child: const Text(
                  'put number',
                  style: TextStyle(fontSize: 50),
                )),
          ],
        ),
      ),
    );
  }
}
