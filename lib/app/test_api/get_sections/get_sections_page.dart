import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'get_sections_controller.dart';

class GetSectionsPage extends GetView<GetSectionsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dio Page'),
      ),
      body: controller.obx((state) {
        return ListView.builder(
          itemCount: state.length,
          itemBuilder: (_, index) {
            return ListTile(
              title: Text(state[index].id),
              subtitle: Text(state[index].name),
            );
          },
        );
      }, onError: (error) {
        return SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(error!),
              TextButton(
                onPressed: () => controller.findSections(),
                child: Text('Tentar novamente'),
              )
            ],
          ),
        );
      }),
    );
  }
}
