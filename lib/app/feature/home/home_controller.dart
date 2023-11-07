import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  late RxInt days;
  final isLoading = false.obs;
  FirebaseAuth auth = FirebaseAuth.instance;
  var userName = "".obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    userName.value = auth.currentUser?.displayName ?? "";
    days = await getDays();
  }


  Future<RxInt> getDays() async {
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 1));
    isLoading.value = false;
    update();
    return RxInt(12); // TODO : get days from firebase
  }
}