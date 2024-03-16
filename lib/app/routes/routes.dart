import 'package:get/get.dart';
import 'package:nouvel_air/app/feature/auth/auth_binding.dart';
import 'package:nouvel_air/app/feature/auth/views/login_view.dart';
import 'package:nouvel_air/app/feature/home/home_binding.dart';
import 'package:nouvel_air/app/feature/home/views/home_view.dart';
import 'package:nouvel_air/app/feature/navigation/navigation_binding.dart';
import 'package:nouvel_air/app/feature/navigation/views/navigation_view.dart';
import 'package:nouvel_air/app/feature/partner_offers/partner_offers_binding.dart';
import 'package:nouvel_air/app/feature/partner_offers/views/list_offers_view.dart';
import 'package:nouvel_air/app/feature/pool/pool_bindind.dart';
import 'package:nouvel_air/app/feature/pool/views/credit_pool_view.dart';
import 'package:nouvel_air/app/feature/pool/views/pool_view.dart';
import 'package:nouvel_air/app/feature/stats/stats_binding.dart';
import 'package:nouvel_air/app/feature/stats/views/details_stats_view.dart';
import 'package:nouvel_air/app/feature/stats/views/stats_view.dart';

final routes = [
  GetPage(
      name: '/login', page: () => const LoginView(), binding: AuthBinding()),
  GetPage(
      name: '/',
      page: () => const NavigationView(),
      binding: NavigationBinding()),
  GetPage(name: '/home', page: () => const HomeView(), binding: HomeBinding()),
  GetPage(
      name: '/stats', page: () => const StatsView(), binding: StatsBinding()),
  GetPage(
      name: '/stats/details',
      page: () => const DetailsStatsView(),
      binding: StatsBinding()),
  GetPage(
      name: '/cagnotte', page: () => const PoolView(), binding: PoolBinding()),
  GetPage(
      name: '/cagnotte/add',
      page: () => const CreditPoolView(),
      binding: PoolBinding()),
  GetPage(
      name: '/partner-offers',
      page: () => const ListOffersView(),
      binding: PartnerOffersBinding()),
];
