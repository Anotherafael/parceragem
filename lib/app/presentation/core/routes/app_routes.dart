import 'package:get/get.dart';
import 'package:parceragem/app/presentation/features/home/home_client.dart';
import 'package:parceragem/app/presentation/features/home/home_page.dart';
import 'package:parceragem/app/presentation/features/home/home_professional.dart';
import 'package:parceragem/app/presentation/features/home/search.dart';
import 'package:parceragem/app/presentation/features/orders/orders_listing.dart';
import 'package:parceragem/app/presentation/features/orders/profession_filter.dart';
import 'package:parceragem/app/presentation/features/orders/section_filter.dart';
import 'package:parceragem/app/presentation/features/orders/task_filter.dart';

class AppRoutes{
  static List<GetPage> get pages=>[
    GetPage(name: "/", page: () => const HomePage()),
    GetPage(name: "/homeclient", page: () => const HomeClient()),
    GetPage(name: "/homeprofessional", page: () => const HomeProfessional()),
    GetPage(name: "/search", page: () => const Search()),
    GetPage(name: "/orderlisting", page: () => const OrderListing()),
    GetPage(name: "/sectionfilter", page: () => const SectionFilter()),
    GetPage(name: "/professionfilter", page: () => const ProfessionFilter()),
    GetPage(name: "/taskfilter", page: () => const TaskFilter()),
  ];
}