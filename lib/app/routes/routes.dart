import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nouvel_air/app/feature/auth/auth_binding.dart';
import 'package:nouvel_air/app/feature/auth/views/login_view.dart';
import 'package:nouvel_air/app/feature/home/home_binding.dart';
import 'package:nouvel_air/app/feature/home/views/home_view.dart';
import 'package:nouvel_air/app/feature/navigation/navigation_binding.dart';
import 'package:nouvel_air/app/feature/navigation/views/navigation_view.dart';
import 'package:nouvel_air/app/feature/partner_offers/partner_offers_binding.dart';
import 'package:nouvel_air/app/feature/partner_offers/views/list_offers_view.dart';

final routes = [
  GetPage(
      name: '/login', page: () => const LoginView(), binding: AuthBinding()),
  GetPage(
      name: '/',
      page: () => const NavigationView(),
      binding: NavigationBinding()),
  GetPage(name: '/home', page: () => const HomeView(), binding: HomeBinding()),
  GetPage(
      name: '/cagnotte',
      page: () => const Scaffold(body: Center(child: Text('Cagnotte'))),
      binding: HomeBinding()),
  GetPage(
      name: '/partner-offers',
      page: () => const ListOffersView(),
      binding: PartnerOffersBinding()),
];
