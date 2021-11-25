import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';

class CustomAppbar extends PreferredSize {
  CustomAppbar()
      : super(
          preferredSize: Size.fromHeight(100),
          child: SafeArea(
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                color: AppColors.colorLightPrimary,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Stack(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        child: Icon(
                          Icons.logout,
                          color: Colors.grey,
                        ),
                        onTap: (){
                          
                        },
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.people_alt_rounded,
                        color: Colors.white,
                        size: 80,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
}
