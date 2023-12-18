import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nouvel_air/app/common/components/card.dart';
import 'package:nouvel_air/app/feature/auth/components/decorations.dart';
import 'package:nouvel_air/app/feature/partner_offers/partner_offers_controller.dart';
import 'package:nouvel_air/app/feature/partner_offers/views/offers_section.dart';
import 'package:nouvel_air/core/utils/colors.dart';
import 'package:nouvel_air/core/utils/font_styles.dart';

class ListOffersView extends StatelessWidget {
  const ListOffersView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PartnerOffersController>(
      init: PartnerOffersController(),
      builder: (controller) {
        return Scaffold(
          // appBar: AppBar(
          //   elevation: 0,
          //   flexibleSpace: Image(
          //     image: AssetImage("assets/images/app_bg.png"),
          //     fit: BoxFit.cover,
          //   ),
          //   toolbarHeight: 50,
          //   backgroundColor: Colors.transparent,
          //   leading:
          // ),
          body: Container(
            decoration: appBackground,
            // padding: const EdgeInsets.only(top: 12),
            child: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                        child: IconButton(
                      icon: const Icon(Icons.arrow_back_ios),
                      color: primaryTitle,
                      onPressed: () => Get.back(),
                    )),
                    const SizedBox(height: 16),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Offres Partenaires",
                            style: h1Style,
                            textAlign: TextAlign.left,
                          ),
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
                    // Add a form with a search bar
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Form(
                          key: controller.searchFormKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextFormField(
                                controller: controller.searchController,
                                cursorColor: primaryText,
                                onFieldSubmitted: (value) {
                                  controller.filterOffers(value);
                                },
                                decoration: const InputDecoration(
                                    filled: true,
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.never,
                                    fillColor: Colors.white,
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xFF687787), width: 1.0),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xFF687787), width: 1.0),
                                    ),
                                    border: OutlineInputBorder(),
                                    suffixIcon: Icon(
                                      Icons.search,
                                      color: Color(0xFF687787),
                                    ),
                                    labelStyle: TextStyle(
                                        color: Color(0xFF687787), fontSize: 16),
                                    labelText:
                                        'Chercher un partenaire, une offre'),
                              ),
                              // RaisedButton(
                              //   child: Text('Login'),
                              //   onPressed: controller.login,
                              // )
                            ],
                          )),
                    ),

                    const SizedBox(height: 40),
                    Center(
                        child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: CardComponent(
                          title: 'Dernières offres',
                          child: Container(
                              margin: const EdgeInsets.symmetric(
                                  vertical: 16, horizontal: 8),
                              child: const OffersSection())),
                    )),
                    const SizedBox(height: 40),
                    Center(
                        child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: CardComponent(
                          title: 'Partenaires favoris',
                          child: Container(
                              margin: const EdgeInsets.symmetric(
                                  vertical: 16, horizontal: 8),
                              child: const OffersSection())),
                    )),
                    const SizedBox(height: 40),
                    Center(
                        child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: CardComponent(
                          title: 'Par thèmes',
                          child: Container(
                              margin: const EdgeInsets.symmetric(
                                  vertical: 16, horizontal: 8),
                              child: const OffersSection())),
                    )),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
