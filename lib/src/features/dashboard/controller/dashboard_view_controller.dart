import 'package:get/get.dart';

class DashboardViewController extends GetxController {
  final RxInt _index = 1.obs;

  int get currentIndex => _index.value;

  void updateIndex(int index) => _index.value = index;
}
