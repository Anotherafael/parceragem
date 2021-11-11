import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../mock/Task.dart';
import '../../../shared/components/layout.dart';
import '../../../shared/theme/app_colors.dart';
import '../../../shared/theme/app_typography.dart';

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
                      style: AppTypography.normalPrimaryWhite,
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
