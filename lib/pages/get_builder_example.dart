import 'package:flutter/material.dart';
import 'package:flutter_state_management_example/controller/get_builder_controller.dart';
import 'package:get/get.dart';

class GetBuilderExample extends StatelessWidget {
  const GetBuilderExample({super.key});

  /// 단순 상태관리를 위한 GetBuilder

  @override
  Widget build(BuildContext context) {
    /// Getx 의 가장 큰 장점은 context 가 없이 자유롭게 로직과 화면을 분리하는 것인가?!

    /// statelessWidget 이라 init을 못쓰니 어디선가 put 해줘여할 것이야. init에 넣으면 put
    Get.put(GetBuilderController());


    /// 1. GetBuilder를 전체로 감쌀 필요는 없다!
    /// GetBuilder를 전체로 감싸고, 그냥 update를 했을 경우에는 setState와 다른 점이 거의 없다.
    /// 더 쪼개서 감싸고 특정해서 update를 해야한다.
    ///
    /// 2. 변수를 하나만 써도 된다.
    /// 공통으로 쓰이는 변수고 독립적으로 관리가 되야한다면 id를 쓰면 된다.


    return Scaffold(
      appBar: AppBar(
        title: const Text('GetBuilder Example'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            /// 원래 짜던 방식
            // GetBuilder<GetBuilderController>(
            //   builder: (controller) {
            //     return Text(
            //       '${controller.count}',
            //       style: const TextStyle(fontSize: 50),
            //     );
            //   },
            // ),
            // GetBuilder<GetBuilderController>(
            //   builder: (controller) {
            //     return Text(
            //       '${controller.count}',
            //       style: const TextStyle(fontSize: 50),
            //     );
            //   },
            // ),
            // ElevatedButton(
            //     onPressed: () {
            //       Get.find<GetBuilderController>().increase();
            //     },
            //     child: const Text(
            //       '1번',
            //       style: TextStyle(fontSize: 50),
            //     )),
            // const SizedBox(height: 8),
            // ElevatedButton(
            //     onPressed: () {
            //       Get.find<GetBuilderController>().increase();
            //     },
            //     child: const Text(
            //       '2번',
            //       style: TextStyle(fontSize: 50),
            //     )),

            /// 쪼개서 짜는 방식
            GetBuilder<GetBuilderController>(
              id: '1번',
              builder: (controller) {
                return Text(
                  '${controller.count}',
                  style: const TextStyle(fontSize: 50),
                );
              },
            ),
            GetBuilder<GetBuilderController>(
              builder: (controller) {
                return Text(
                  '${controller.count}',
                  style: const TextStyle(fontSize: 50),
                );
              },
            ),
            ElevatedButton(
                onPressed: () {
                  Get.find<GetBuilderController>().increase(id: '1번');
                },
                child: const Text(
                  '1번',
                  style: TextStyle(fontSize: 50),
                )),
            const SizedBox(height: 8),
            ElevatedButton(
                onPressed: () {
                  Get.find<GetBuilderController>().increase();
                },
                child: const Text(
                  '2번',
                  style: TextStyle(fontSize: 50),
                )),
          ],
        ),
      ),
    );
  }
}
