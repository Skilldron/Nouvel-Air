import 'package:firebase_auth/firebase_auth.dart';
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
      // final response = await http.get(Uri.parse(
      //     'https://nouvel-air-api.herokuapp.com/api/v1/partner_offers'));
      // if (response.statusCode == 200) {
      //   final data = jsonDecode(response.body);
      //   offers.value = data['data'];
      // }
      offersFetched.addAll([
        {
          "title": "Offre 1",
          "imageURI": "https://picsum.photos/200/300",
          "categorie": ["Categorie 1", "Categorie 2"],
          "OfferDescription": "Description de l'offre 1"
        },
        {
          "title": "Offre 2",
          "imageURI": "https://picsum.photos/200/300",
          "categorie": ["Categorie 1", "Categorie 2"],
          "OfferDescription": "Description de l'offre 2"
        },
        {
          "title": "Offre 3",
          "imageURI": "https://picsum.photos/200/300",
          "categorie": ["Categorie 1", "Categorie 2"],
          "OfferDescription": "Description de l'offre 3"
        },
        {
          "title": "Offre 4",
          "imageURI": "https://picsum.photos/200/300",
          "categorie": ["Categorie 1", "Categorie 2"],
          "OfferDescription": "Description de l'offre 4"
        },
        {
          "title": "Offre 5",
          "imageURI": "https://picsum.photos/200/300",
          "categorie": ["Categorie 1", "Categorie 2"],
          "OfferDescription": "Description de l'offre 5"
        },
        {
          "title": "Offre 6",
          "imageURI": "https://picsum.photos/200/300",
          "categorie": ["Categorie 1", "Categorie 2"],
          "OfferDescription": "Description de l'offre 6"
        },
      ]);

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
