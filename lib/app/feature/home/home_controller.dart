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
  int euroSave = 0;
  int cigaretteEscape = 0;
  int cashbackEarn = 0;

  @override
  Future<void> onInit() async {
    super.onInit();
    userName.value = auth.currentUser?.displayName ?? "";
    getDays();
    await getThreeOffers();
    await saveEuro();
    cigaretteEscape = getCigaretteEscape();
    cashbackEarn = await getCashbackEarn();
    update();
  }

  Future<void> getDays() async {
    isLoading.value = true;
    var userDoc = await firestore.collection('users').doc(user.uid).get();
    var createdAt = userDoc.data()!['createdAt'];

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

  Future<void> saveEuro() async {
    var historyDoc =
        firestore.collection('pool').doc(user.uid).collection('history');
    // get the somme of all the amount in the history which are credits
    var historyData = await historyDoc
        .where('type', isEqualTo: 'credit')
        .aggregate(sum('amount'))
        .get();

    euroSave = historyData.getSum('amount') == null
        ? 0
        : historyData.getSum('amount')!.toInt();

    update();
  }

  int getCigaretteEscape() {
    return euroSave ~/ 1.7;
  }

  Future<int> getCashbackEarn() async {
    var historyDoc =
        firestore.collection('pool').doc(user.uid).collection('history');
    // get the somme of all the amount in the history which are credits
    var amountCashback = await historyDoc
        .where('type', isEqualTo: 'credit')
        .aggregate(sum('cashback'))
        .get();

    return amountCashback.getSum('cashback') == null
        ? 0
        : amountCashback.getSum('cashback')!.toInt();
  }
}
