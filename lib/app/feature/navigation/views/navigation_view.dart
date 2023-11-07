import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nouvel_air/app/feature/home/views/home_view.dart';
import 'package:nouvel_air/app/feature/navigation/navigation_controller.dart';
import 'package:nouvel_air/core/utils/colors.dart';

class NavigationView extends GetWidget<NavigationController> {
  const NavigationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavigationController>(builder: (controller) {
      return Scaffold(
        body: IndexedStack(
          index: controller.tabIndex,
          children: const [
            HomeView(),
            Scaffold(body: Center(child: Text('Stats'))),
            Scaffold(body: Center(child: Text('Cagnotte'))),
            Scaffold(body: Center(child: Text('Soutien'))),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
            items: [
              _bottomNavigationBarItem(const Icon(Icons.home), 'Accueil'),
              _bottomNavigationBarItem(
                  const Icon(Icons.stacked_bar_chart_sharp), 'Stats'),
              _bottomNavigationBarItem(
                  const Icon(Icons.monetization_on_rounded), 'Cagnotte'),
              _bottomNavigationBarItem(const Icon(Icons.handshake), 'Soutien')
            ],
            selectedItemColor: primaryText,
            unselectedItemColor: primaryTitle,
            type: BottomNavigationBarType.fixed,
            onTap: controller.changeTabIndex,
            showUnselectedLabels: true,
            currentIndex: controller.tabIndex),
      );
    });
  }
}

_bottomNavigationBarItem(Icon icon, String label) {
  return BottomNavigationBarItem(
    icon: icon,
    label: label,
  );
}
