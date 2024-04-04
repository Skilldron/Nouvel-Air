import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nouvel_air/app/common/components/card.dart';
import 'package:nouvel_air/app/feature/auth/components/decorations.dart';
import 'package:nouvel_air/app/feature/home/home_controller.dart';
import 'package:nouvel_air/app/feature/home/views/overview_content_view.dart';
import 'package:nouvel_air/app/feature/home/views/partner_content_view.dart';
import 'package:nouvel_air/app/feature/profile/views/profile_page.dart';
import 'package:nouvel_air/core/utils/colors.dart';
import 'package:nouvel_air/core/utils/font_styles.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (_) {
        return Scaffold(
            body: Container(
          decoration: appBackground,
          padding: const EdgeInsets.only(top: 16),
          child: SafeArea(
              child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Bonjour ${_.userName} !",
                        style: h1Style,
                        textAlign: TextAlign.left,
                      ),
                      GestureDetector(
                          onTap: () => Get.to(ProfilePage()),
                          child: const Icon(Icons.account_circle_rounded,
                              size: 29, color: primaryText))
                    ],
                  ),
                ),
                const FractionalTranslation(
                  translation: Offset(0.11, 0),
                  child: SizedBox(
                      width: 126,
                      height: 5,
                      child: SizedBox(
                        height: 1,
                        width: 1,
                        child: ColoredBox(color: primaryTitle),
                      )),
                ),
                const SizedBox(height: 40),
                Center(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: CardComponent(
                      title: 'Synthèse',
                      child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 16),
                          child: const OverviewContentView())),
                )),
                const SizedBox(height: 48),
                Center(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: CardComponent(
                    title: 'Offres Partenaires',
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 16),
                      child: PartnerContentView(
                        offers: _.offers,
                      ),
                    ),
                  ),
                )),
                const SizedBox(height: 32),
              ],
            ),
          )),
        ));
      },
    );
  }
}
