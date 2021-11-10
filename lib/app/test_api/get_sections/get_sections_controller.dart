import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parceragem/app/domain/core/failures/server_failures.dart';
import 'package:parceragem/app/domain/repositories/i_section_repository.dart';

class GetSectionsController extends GetxController with StateMixin {
  final ISectionRepository _dioRepository;

  GetSectionsController(this._dioRepository);

  @override
  void onInit() {
    super.onInit();
    findSections();
  }

  Future<void> findSections() async {
    change([], status: RxStatus.loading());
    try {
      final result = await _dioRepository.getSections();
      result.fold((l) {
        switch (l) {
          case ServerFailures.notFound:
            Get.defaultDialog(title: 'Erro de Servidor');
            break;
          case ServerFailures.serverError:
            Get.defaultDialog(title: 'Erro de Servidor');
            break;
        }
      }, (r) => change(r, status: RxStatus.success()));
    } catch (e) {
      print(e);
      change([], status: RxStatus.error('Erro ao buscar usuários'));
    }
  }
}
