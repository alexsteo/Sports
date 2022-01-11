
import 'package:get/get.dart';

class FilterModel {
  RxBool disabled = false.obs;
  List<String> categories = <String>[].obs;
  RxString location = "".obs;

  @override
  String toString() {
    return 'FilterModel{disabled: $disabled, categories: $categories, location: $location}';
  }
}

class FilterState {
  FilterModel filter = FilterModel();
}
