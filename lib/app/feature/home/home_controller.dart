import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:nouvel_air/app/feature/auth/auth_controller.dart';

class HomeController extends GetxController {
  final RxInt days = 0.obs;
  final isLoading = false.obs;
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  User user = AuthController.instance.user!;
  var userName = "".obs;
  final offers = [].obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    userName.value = auth.currentUser?.displayName ?? "";
    getDays();
    await getThreeOffers();
  }

  Future<void> getDays() async {
    isLoading.value = true;
    var userDoc = await firestore.collection('users').doc(user.uid).get();
    var createdAt = userDoc.data()!['createdAt'];

    // TODO: Enhanced the code. It's du to the fact that the createdAt field is not yet initialized in the database when initializing the HomeController after the signup
    if (createdAt != null) {
      createdAt = createdAt.toDate();
      // Get current date
      var now = DateTime.now();
      // Calculate the difference between now and createdAt
      var difference = now.difference(createdAt);
      // Get the days from the difference
      days.value = difference.inDays;
    }
    isLoading.value = false;
    update();
  }

  Future<void> getThreeOffers() async {
    offers.value = await FirebaseFirestore.instance
        .collection('Offers')
        .limit(3)
        .get()
        .then((value) => value.docs);
  }
}
