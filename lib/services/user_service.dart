import 'package:get/get.dart';
import 'package:sports/services/events_service.dart';

class UserService {
  static UserService get to => Get.find();

  final RxString username = "defaultUser".obs;
  final RxList<Event> events = <Event>[EventsService.to.events[1]].obs;
  final RxBool disabled = false.obs;
  final RxString phoneNumber = "".obs;
}
