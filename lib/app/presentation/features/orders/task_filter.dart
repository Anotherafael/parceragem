import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parceragem/app/mock/Task.dart';
import 'package:parceragem/app/presentation/shared/components/layout.dart';
import 'package:parceragem/app/presentation/shared/theme/AppColors.dart';
import 'package:parceragem/app/presentation/shared/theme/AppFonts.dart';

class TaskFilter extends StatefulWidget {
  const TaskFilter({Key? key}) : super(key: key);
  @override
  _TaskFilterState createState() => _TaskFilterState();
}

class _TaskFilterState extends State<TaskFilter> {
  final int professionId = Get.arguments;
  late List tasksList = [];
  @override
  void initState() {
    super.initState();
    for (var item in tasks) {
      if (item['profession_id'] == professionId) tasksList.add(item);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      body: ListView.builder(
        itemCount: tasksList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: GestureDetector(
              onTap: () {
                Get.toNamed("/orderlisting", arguments: tasksList[index]['id']);
              },
              child: SizedBox(
                height: 50,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: AppColors.colorLightPrimary,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      tasksList[index]['name'],
                      style: AppFonts.normalPrimaryWhite,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
