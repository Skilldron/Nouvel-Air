import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:nouvel_air/app/feature/pool/pool_controller.dart';

class PartnerOfferDetailController extends GetxController {
  final arguments = Get.arguments;
  Map<String, dynamic>? offer = {
    "title": "",
    "description": "",
    "imageURI": null,
    "offerDescription": "",
    "price": 0,
    "offerSubdescription": ""
  };
  final pool = 0.0.obs;
  final PoolController poolController = Get.find<PoolController>();

  @override
  void onInit() async {
    super.onInit();
    await getOfferDetail();
    pool.value = poolController.pool;
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

  FutureOr<double> fetchPool() async {
    var poolDoc = FirebaseFirestore.instance.collection('pool').doc('user.uid');

    try {
      var poolData = await poolDoc.get();
      if (poolData.exists) {
        return poolData.data()!['pool'];
      }
    } catch (e) {
      rethrow;
    }

    return 0.0;
  }
}
