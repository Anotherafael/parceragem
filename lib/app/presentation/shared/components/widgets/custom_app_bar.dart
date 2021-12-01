import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:parceragem/app/infra/core/http/parceragem_client.dart';
import 'package:parceragem/app/infra/repositories/i_auth_repository_impl.dart';
import 'package:parceragem/app/presentation/shared/controllers/app_bar_controller.dart';
import 'package:parceragem/app/presentation/shared/theme/app_typography.dart';

import '../../theme/app_colors.dart';

// ignore: must_be_immutable
class CustomAppbar extends PreferredSize {
  static final controller = AppBarController(
    IAuthRepositoryImpl(
      ParceragemClient(),
    ),
  );
  String? title;
  CustomAppbar(this.title)
      : super(
          preferredSize: Size.fromHeight(300),
          child: SafeArea(
            child: Container(
              alignment: Alignment.center,
              height: 150,
              decoration: BoxDecoration(
                gradient: AppColors.dangerGradient,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(135),
                  bottomRight: Radius.circular(135),
                ),
              ),
              child: Center(
                child: Text(
                  title!,
                  textAlign: TextAlign.center,
                  style: AppTypography.titlePage,
                ),
              ),
            ),
          ),
        );
}
