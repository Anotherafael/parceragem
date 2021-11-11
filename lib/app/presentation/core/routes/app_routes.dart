import 'package:get/get.dart';

import '../../features/home/home_client/bindings/home_bindings.dart';
import '../../features/home/home_client/home_client.dart';
import '../../features/home/home_professional/home_professional.dart';
import '../../features/home/select_provider_page.dart';
import '../../features/my_request/search.dart';
import '../../features/order_request/select_profession/bindings/select_profession_bindings.dart';
import '../../features/order_request/select_profession/select_profession_page.dart';
import '../../features/order_request/select_professional/create_order_page.dart';
import '../../features/order_request/select_section/bindings/select_section_bindings.dart';
import '../../features/order_request/select_section/select_section_page.dart';

class AppRoutes {
  static List<GetPage> get pages => [
        GetPage(
          name: "/",
          page: () => const SelectProviderPage(),
        ),
        GetPage(
          name: "/homeclient",
          page: () => const HomeClient(),
          binding: HomeBindinds(),
        ),
        GetPage(
          name: "/homeprofessional",
          page: () => const HomeProfessional(),
          binding: HomeBindinds(),
        ),
        GetPage(
          name: "/search",
          page: () => const MyRequestPage(),
        ),
        GetPage(
          name: "/orderlisting",
          page: () => const OrderListing(),
        ),
        GetPage(
          name: "/sectionlisting",
          page: () => SelectSectionPage(),
          binding: SelectSectionBindings(),
        ),
        GetPage(
          name: "/professionfilter",
          page: () => SelectProfessionPage(),
          binding: SelectProfessionBindings(),
        ),
        // GetPage(
        //   name: "/taskfilter/:sectionId",
        //   page: () => const TaskFilter(),
        // ),
      ];
}
