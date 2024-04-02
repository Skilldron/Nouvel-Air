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

  @override
  Future<void> onInit() async {
    super.onInit();
    userName.value = auth.currentUser?.displayName ?? "";
    getDays();
  }

  Future<void> getDays() async {
    isLoading.value = true;
    var userDoc = await firestore.collection('users').doc(user.uid).get();
    // Get createdAt data field and fix the date location
    var createdAt = userDoc.data()!['createdAt'].toDate();
    // Get current date
    var now = DateTime.now();
    // Calculate the difference between now and createdAt
    var difference = now.difference(createdAt);
    // Get the days from the difference
    days.value = difference.inDays;

    isLoading.value = false;
    update();
  }
}
