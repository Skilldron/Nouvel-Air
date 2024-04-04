import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class PartnerOffersController extends GetxController {
  // Search bar
  final searchFormKey = GlobalKey<FormState>();
  final searchController = TextEditingController();

  final isLoading = false.obs;
  FirebaseAuth auth = FirebaseAuth.instance;

  // TODO: Change dynamic to Offer model
  late RxList<dynamic> offers = [].obs;

  // OffersFetched is an array of offers
  late RxList<dynamic> offersFetched = [].obs;

  @override
  Future<void> onInit() async {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    fetchOffers();

    // Update offers data value to update the UI
    update();
  }

  Future<void> fetchOffers() async {
    try {
      isLoading.value = true;
      offersFetched.value = await FirebaseFirestore.instance
          .collection('Offers')
          .limit(3)
          .get()
          .then((value) => value.docs);

      offers.addAll(offersFetched);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    } finally {
      isLoading.value = false;
    }
  }

  void filterOffers(String value) {
    if (value.isEmpty) {
      offers.addAll(offersFetched);
      return;
    }

    offers.value = offersFetched.where((offer) {
      return offer['title'].toLowerCase().contains(value.toLowerCase());
    }).toList();
  }
}
