import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../mock/Task.dart';
import '../../../shared/components/layout.dart';
import '../../../shared/theme/AppColors.dart';
import '../../../shared/theme/AppFonts.dart';

class TaskFilter extends StatefulWidget {
  const TaskFilter({Key? key, required this.professionId}) : super(key: key);
  final int professionId;
  @override
  _TaskFilterState createState() => _TaskFilterState();
}

class _TaskFilterState extends State<TaskFilter> {
  late List tasksList = [];
  @override
  void initState() {
    super.initState();
    for (var item in tasks) {
      if (item['profession_id'] == widget.professionId) tasksList.add(item);
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
