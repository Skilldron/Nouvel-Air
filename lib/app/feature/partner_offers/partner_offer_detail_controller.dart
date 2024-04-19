import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:nouvel_air/app/feature/pool/pool_controller.dart';

class PartnerOfferDetailController extends GetxController {
  final arguments = Get.arguments;
  Map<String, dynamic> offer = {
    "title": "",
    "description": "",
    "imageURI": null,
    "offerDescription": "",
    "price": 0.0,
    "offerSubdescription": "",
    "code": ""
  };
  final pool = 0.0.obs;
  final PoolController poolController = Get.find<PoolController>();
  bool isPurchasingOffer = false;
  bool isOfferPurchased = false;

  @override
  void onInit() async {
    super.onInit();
    await getOfferDetail();
    pool.value = poolController.pool;
    await isOfferAlreadyPurchased();
    update();
  }

  Future<void> getOfferDetail() async {
    try {
      var data = await FirebaseFirestore.instance
          .collection('Offers')
          .doc(arguments['id'])
          .get()
          .then((value) => value.data());

      if (data != null) {
        offer = data;
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    } finally {
      // isLoading.value = false;
    }
  }

  void toggleIsPurchasingOffer() {
    isPurchasingOffer = !isPurchasingOffer;
    pool.value = pool.value - offer['price'];
    update();
  }

  Future<void> confirmPurchase() async {
    var user = FirebaseFirestore.instance
        .collection('users')
        .doc(poolController.user.uid);

    if ((await user.get()).exists) {
      await user.collection('offers').add(offer);
    }

    poolController.debit(offer['price'].toDouble(), "debit");

    isOfferPurchased = true;
    update();
  }

  isOfferAlreadyPurchased() async {
    var user = FirebaseFirestore.instance
        .collection('users')
        .doc(poolController.user.uid);

    var offers = await user.collection('offers').get();

    if (offers.docs.isNotEmpty) {
      isOfferPurchased =
          offers.docs.any((element) => element.data()['uuid'] == offer['uuid']);
    }
    update();
  }
}
