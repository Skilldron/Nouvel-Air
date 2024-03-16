// Create PoolController
import 'package:get/get.dart';

class PoolController extends GetxController {
  final _pool = 0.obs;
  int get pool => _pool.value;
  // History field which is a list of object with amount and date
  var history = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();

    history.value = [
      {'amount': 100, 'date': DateTime.now()},
      {'amount': 200, 'date': DateTime.now()},
      {'amount': 300, 'date': DateTime.now()},
      {'amount': 400, 'date': DateTime.now()},
      {'amount': 500, 'date': DateTime.now()},
    ];
  }

  //loading field
  final isLoading = false.obs; // TODO: Implement loading state

  void credit(int amount) {
    _pool.value += amount;
    history.add({'amount': amount, 'date': DateTime.now()});
    update();
  }

  void debit(int amount) {
    _pool.value -= amount;
    history.add({'amount': -amount, 'date': DateTime.now()});
    update();
  }

  //Getter history
  List get getHistory => history.toList();
}
