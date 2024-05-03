import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:nouvel_air/app/feature/auth/auth_controller.dart';

class StatsController extends GetxController {
  bool isEconomiesVisible = false;
  late List<Map<String, dynamic>> tropheesEarned = [];
  User user = AuthController.instance.user!;

  @override
  void onInit() async {
    super.onInit();

    tropheesEarned = await getTropheesEarned();
    update();
  }

  void showEconomies() {
    isEconomiesVisible = !isEconomiesVisible;
    update();
  }

  Future<dynamic> getTropheesEarned() async {
    // Get the user's trophees earned
    var tropheeSnapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .collection('trophee')
        .get();

    return tropheeSnapshot.docs.map((e) => {...e.data()}).toList();
  }
}
