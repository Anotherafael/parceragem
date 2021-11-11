import 'package:get/get.dart';
import 'package:parceragem/app/presentation/core/bindings/home_bindings.dart';
import 'package:parceragem/app/presentation/core/bindings/professions_filter_bindings.dart';
import 'package:parceragem/app/presentation/core/bindings/section_filter_bindings.dart';
import 'package:parceragem/app/presentation/features/orders/pages/orders_listing.dart';
import 'package:parceragem/app/presentation/features/orders/pages/profession_filter.dart';
import 'package:parceragem/app/presentation/features/orders/pages/section_filter.dart';
import '../../features/home/home_client.dart';
import '../../features/home/home_page.dart';
import '../../features/home/home_professional.dart';
import '../../features/home/search.dart';

class AppRoutes {
  static List<GetPage> get pages => [
        GetPage(
          name: "/",
          page: () => const HomePage(),
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
          page: () => const Search(),
        ),
        GetPage(
          name: "/orderlisting",
          page: () => const OrderListing(),
        ),
        GetPage(
          name: "/sectionlisting",
          page: () => SectionFilter(),
          binding: SectionFilterBindings(),
        ),
        GetPage(
          name: "/professionfilter",
          page: () => ProfessionFilter(),
          binding: ProfessionFilterBindings(),
        ),
        // GetPage(
        //   name: "/taskfilter/:sectionId",
        //   page: () => const TaskFilter(),
        // ),
      ];
}
