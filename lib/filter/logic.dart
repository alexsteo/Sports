import 'package:get/get.dart';
import 'package:sports/services/filter_service.dart';

import 'state.dart';

class FilterLogic extends GetxController {
  final FilterState state = FilterState();

  @override
  void onClose() {
    FilterService.to.filter.value = state.filter;
    super.onClose();
  }

}
