import 'package:get/get.dart';
import 'package:sports/organize_event/view.dart';
import 'package:sports/services/events_service.dart';

class OrganizeEventState {
  OrganizeEventState() {}

  RxString image = "".obs;
  RxString eventName = "".obs;
  RxString eventType = sports[0].obs;
  RxString location = "".obs;
  Rx<DateTime> date = DateTime.now().obs;
  RxInt minParticipants = 0.obs;
  RxInt maxParticipants = 10.obs;
  RxString requiredEquipment = "".obs;
  RxString experienceLevel = experienceLevels[0].obs;
  RxBool paid = false.obs;
  RxBool disabilityFriendly = false.obs;
  RxDouble fee = 9.9.obs;

  getEvent() => Event(
      image.value,
      eventName.value,
      eventType.value,
      location.value,
      date.value,
      minParticipants.value,
      maxParticipants.value,
      requiredEquipment.value,
      experienceLevel.value,
      paid.value,
      fee.value,
      disabilityFriendly.value);
}
