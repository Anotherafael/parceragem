import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:parceragem/app/infra/core/http/parceragem_client.dart';
import 'package:parceragem/app/infra/repositories/i_auth_repository_impl.dart';
import 'package:parceragem/app/presentation/shared/controllers/app_bar_controller.dart';

import '../../theme/app_colors.dart';

class CustomAppbar extends PreferredSize {
  static final controller = AppBarController(IAuthRepositoryImpl(ParceragemClient()));
  CustomAppbar()
      : super(
          preferredSize: Size.fromHeight(100),
          child: SafeArea(
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
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
                          size: 36,
                          color: AppColors.whiteColor,
                        ),
                        onTap: () async {
                          controller.logout();
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
}
