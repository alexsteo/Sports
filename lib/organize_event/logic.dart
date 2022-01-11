import 'package:get/get.dart';
import 'package:sports/services/events_service.dart';

import 'state.dart';

class OrganizeEventLogic extends GetxController {
  final OrganizeEventState state = OrganizeEventState();

  addEvent() {
    EventsService.to.events.add(state.getEvent());
    Get.back();
  }
}
