import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parceragem/app/mock/Profession.dart';
import 'package:parceragem/app/presentation/features/orders/task_filter.dart';
import 'package:parceragem/app/presentation/shared/components/layout.dart';
import 'package:parceragem/app/presentation/shared/theme/AppColors.dart';
import 'package:parceragem/app/presentation/shared/theme/AppFonts.dart';

class ProfessionFilter extends StatefulWidget {
  const ProfessionFilter({ Key? key}) : super(key: key);
  @override
  _ProfessionFilterState createState() => _ProfessionFilterState();
}

class _ProfessionFilterState extends State<ProfessionFilter> {
  final int sectionId = Get.arguments;
  late List professionsList=[];
  @override
  void initState() {
    super.initState();
    for (var item in professions) {
      if(item['area_id']==sectionId)
      professionsList.add(item);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Layout(
      body: ListView.builder(
        itemCount: professionsList.length,
        itemBuilder: (context, index){
          return Padding(
              padding: const EdgeInsets.all(10.0),
              child: GestureDetector(
                onTap: (){
                  Get.toNamed("/taskfilter", arguments: professionsList[index]['id']);
                },
                child: SizedBox(
                  height: 50,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: AppColors.colorLightPrimary,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Center(child: Text(professionsList[index]['name'], style: AppFonts.normalPrimaryWhite)),
                  )
                ),
              )
            );
        }
        ),
    );
  }
}