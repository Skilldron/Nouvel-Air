import 'package:get/get.dart';
import 'package:nouvel_air/app/feature/auth/auth_binding.dart';
import 'package:nouvel_air/app/feature/auth/views/login_view.dart';
import 'package:nouvel_air/app/feature/navigation/navigation_binding.dart';
import 'package:nouvel_air/app/feature/navigation/views/navigation.dart';

final routes = [
  GetPage(name: '/login', page: () => const LoginView(), binding: AuthBinding()),
  GetPage(name: '/', page: () => const NavigationView(), binding: NavigationBinding()),
];
