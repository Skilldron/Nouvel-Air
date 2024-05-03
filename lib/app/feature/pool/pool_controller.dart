// Create PoolController
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:nouvel_air/app/feature/auth/auth_controller.dart';

class PoolController extends GetxController {
  static PoolController instance = Get.put(PoolController());
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  User user = AuthController.instance.user!;
  final _pool = 0.0.obs;
  double get pool => _pool.value;
  // History field which is a list of object with amount and date
  var history = <Map<String, dynamic>>[].obs;
  bool addQuantityByCigarette = false;
  double cigarettePrice = 1.7;
  int nbCigarret = 0;

  @override
  void onInit() {
    super.onInit();

    fetchPool();

    fetchHistory();
  }

  //loading field
  final isLoading = false.obs;

  // Function to get the pool of the current user
  Future<void> fetchPool() async {
    var poolDoc = firestore.collection('pool').doc(user.uid);

    try {
      var poolData = await poolDoc.get();
      if (poolData.exists) {
        _pool.value = poolData.data()!['pool'];
      }
    } catch (e) {
      rethrow;
    }

    update();
  }

  // Function to get History sorted by ascending date
  Future<void> fetchHistory() async {
    var historyDoc = firestore
        .collection('pool')
        .doc(user.uid)
        .collection('history')
        .orderBy("date");

    try {
      var historyData = await historyDoc.get();

      history.value = historyData.docs.map((e) {
        // If cashback is not null, we return the cashback
        if (e.data()['cashback'] != null) {
          return {
            'amount': e.data()['amount'] + e.data()['cashback'],
            'date': e.data()['date'].toDate(),
            'type': e.data()['type'] == 'credit' ? "+" : "-"
          };
        }

        return {
          'amount': e.data()['amount'],
          'date': e.data()['date'].toDate(),
          'type': e.data()['type'] == 'credit' ? "+" : "-"
        };
      }).toList();
    } catch (e) {
      rethrow;
    }

    update();
  }

  // Function to credit the pool
  Future<void> credit(double amount) async {
    var poolDoc = firestore.collection('pool').doc(user.uid);
    double cashback = amount * 0.05;

    try {
      if (!(await poolDoc.get()).exists) {
        await poolDoc.set({'pool': amount + cashback});
      } else {
        poolDoc.update({'pool': FieldValue.increment(amount + cashback)});
      }

      _pool.value += amount + cashback;
    } catch (e) {
      rethrow;
    }

    await addHistory(amount, cashback, 'credit');
    await fetchHistory();
    update();
  }

  // Function to add history
  Future<void> addHistory(
      double amount, double cashback, String typeTransaction) async {
    var historyDoc =
        firestore.collection('pool').doc(user.uid).collection('history').doc();
    await historyDoc.set({
      'amount': amount,
      'cashback': cashback,
      'date': DateTime.now(),
      'type': typeTransaction
    });
  }

  void debit(double amount, String typeTransaction) async {
    var poolDoc = firestore.collection('pool').doc(user.uid);

    try {
      if (!(await poolDoc.get()).exists) {
        await poolDoc.set({'pool': -amount});
      } else {
        poolDoc.update({'pool': FieldValue.increment(-amount)});
      }

      _pool.value -= amount;
    } catch (e) {
      rethrow;
    }
    await fetchHistory();
    await addHistory(amount, 0, typeTransaction);
    update();
  }

  //Getter history
  List get getHistory => history.toList();

  double calculateAmount() {
    if (addQuantityByCigarette) {
      return cigarettePrice * nbCigarret;
    }
    return 0.0;
  }
}
