import 'package:get/get.dart';
import 'package:parceragem/app/presentation/features/home/home_client.dart';
import 'package:parceragem/app/presentation/features/home/home_page.dart';
import 'package:parceragem/app/presentation/features/home/home_professional.dart';
import 'package:parceragem/app/presentation/features/home/search.dart';
import 'package:parceragem/app/presentation/features/orders/orders_listing.dart';

class AppRoutes{
  static List<GetPage> get pages=>[
    GetPage(name: "/", page: () => const HomePage()),
    GetPage(name: "/homeclient", page: () => const HomeClient()),
    GetPage(name: "/homeprofessional", page: () => const HomeProfessional()),
    GetPage(name: "/search", page: () => const Search()),
    GetPage(name: "/orderlisting", page: () => const OrderListing())
  ];
}