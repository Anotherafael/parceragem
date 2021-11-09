import 'package:flutter/material.dart';
import 'package:parceragem/app/mock/section.dart';
import 'package:parceragem/app/presentation/features/orders/profession_filter.dart';
import 'package:parceragem/app/presentation/shared/components/layout.dart';
import 'package:parceragem/app/presentation/shared/theme/AppColors.dart';
import 'package:parceragem/app/presentation/shared/theme/AppFonts.dart';

class SectionFilter extends StatefulWidget {
  const SectionFilter({ Key? key }) : super(key: key);

  @override
  _SectionFilterState createState() => _SectionFilterState();
}

class _SectionFilterState extends State<SectionFilter> {
  late List sectionsList;
  @override
  void initState() {
    super.initState();
    sectionsList = sections;
  }
  @override
  Widget build(BuildContext context) {
    return Layout(
      body: ListView.builder(
        itemCount: sectionsList.length,
        itemBuilder: (context, index){
          return Padding(
              padding: const EdgeInsets.all(10.0),
              child: GestureDetector(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (_)=>ProfessionFilter(sectionId: sectionsList[index]['id'])));
                },
                child: SizedBox(
                  height: 50,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: AppColors.colorLightPrimary,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Center(child: Text(sectionsList[index]['name'], style: AppFonts.normalPrimaryWhite)),
                  )
                ),
              )
            );
        }
        ),
    );
  }
}