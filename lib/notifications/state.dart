import 'package:get/get_rx/src/rx_types/rx_types.dart';

class NotificationsState {
  NotificationsState() {
    ///Initialize variables
  }

  RxList<String> notifications = <String>[
    "Martin wants to participate to your event Football",
    "Josh accepted your participation in the event Chess",
  ].obs;
}
