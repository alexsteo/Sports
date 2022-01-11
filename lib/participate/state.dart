import 'package:get/get.dart';
import 'package:sports/organize_event/view.dart';

class ParticipateState {
  Rx<String> experienceLevel = experienceLevels[0].obs;

  Rx<String> questions = "".obs;

  RxBool carpool = false.obs;

  RxBool phone = false.obs;

  ParticipateState() {
    ///Initialize variables
  }
}
