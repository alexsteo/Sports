import 'package:get/get.dart';
import 'package:sports/filter/state.dart';

class FilterService {
  final RxString searchTerm = "".obs;


  static FilterService get to => Get.find();

  Rx<FilterModel> filter = FilterModel().obs;
}
