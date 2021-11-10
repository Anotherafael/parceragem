import 'package:flutter/material.dart';
import 'package:parceragem/app/mock/Profession.dart';
import 'package:parceragem/app/presentation/features/orders/task_filter.dart';
import 'package:parceragem/app/presentation/shared/components/layout.dart';
import 'package:parceragem/app/presentation/shared/theme/AppColors.dart';
import 'package:parceragem/app/presentation/shared/theme/AppFonts.dart';

class ProfessionFilter extends StatefulWidget {
  const ProfessionFilter({Key? key, required this.sectionId}) : super(key: key);
  final int sectionId;
  @override
  _ProfessionFilterState createState() => _ProfessionFilterState();
}

class _ProfessionFilterState extends State<ProfessionFilter> {
  late List professionsList = [];
  @override
  void initState() {
    super.initState();
    for (var item in professions) {
      if (item['area_id'] == widget.sectionId) professionsList.add(item);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      body: ListView.builder(
          itemCount: professionsList.length,
          itemBuilder: (context, index) {
            return Padding(
                padding: const EdgeInsets.all(10.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => TaskFilter(
                            professionId: professionsList[index]['id'])));
                  },
                  child: SizedBox(
                      height: 50,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                            color: AppColors.colorLightPrimary,
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                            child: Text(professionsList[index]['name'],
                                style: AppFonts.normalPrimaryWhite)),
                      )),
                ));
          }),
    );
  }
}
