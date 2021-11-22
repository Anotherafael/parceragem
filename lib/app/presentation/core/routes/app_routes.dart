import 'package:get/get.dart';
import 'package:parceragem/app/presentation/features/login/bindings/login_bindings.dart';
import 'package:parceragem/app/presentation/features/login/login_screen.dart';
import 'package:parceragem/app/presentation/features/order_request/select_order/bindings/select_order_bindings.dart';
import 'package:parceragem/app/presentation/features/order_request/select_order/select_order_page.dart';

import '../../features/home/home_client/bindings/home_bindings.dart';
import '../../features/home/home_client/home_client.dart';
import '../../features/home/home_professional/home_professional.dart';
import '../../features/home/select_provider_page.dart';
import '../../features/my_request/my_requests_page.dart';
import '../../features/order_request/select_profession/bindings/select_profession_bindings.dart';
import '../../features/order_request/select_profession/select_profession_page.dart';
import '../../features/order_request/select_section/bindings/select_section_bindings.dart';
import '../../features/order_request/select_section/select_section_page.dart';
import '../../features/order_request/select_task/bindings/select_task_bindings.dart';
import '../../features/order_request/select_task/select_task_page.dart';

class AppRoutes {
  static List<GetPage> get pages => [
        GetPage(
          name: "/login",
          page: () => LoginScreen(),
          binding: LoginBindings()
        ),
        GetPage(
          name: "/",
          page: () => const SelectProviderPage(),
        ),
        GetPage(
          name: "/home/client",
          page: () => const HomeClient(),
          binding: HomeBindinds(),
        ),
        GetPage(
          name: "/home/professional",
          page: () => const HomeProfessional(),
          binding: HomeBindinds(),
        ),
        GetPage(
          name: "/my-requests",
          page: () => const MyRequestPage(),
        ),
        GetPage(
          name: "/order-request/sections",
          page: () => SelectSectionPage(),
          binding: SelectSectionBindings(),
        ),
        GetPage(
          name: "/order-request/professions",
          page: () => SelectProfessionPage(),
          binding: SelectProfessionBindings(),
        ),
        GetPage(
          name: "/order-request/tasks",
          page: () => SelectTaskPage(),
          binding: SelectTaskBindings(),
        ),
        GetPage(
          name: "/order-request/professionals",
          page: () => SelectOrderPage(),
          binding: SelectOrderBindings(),
        ),
      ];
}
