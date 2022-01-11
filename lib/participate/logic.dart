import 'package:date_format/date_format.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:sports/services/events_service.dart';

import 'state.dart';

class ParticipateLogic extends GetxController {
  final ParticipateState state = ParticipateState();

  void participate(Event event) {
    Fluttertoast.showToast(
      msg:
          "You have successfully entered the event ${event.eventName} at ${formatDate(event.date, [
            yy,
            '-',
            M,
            '-',
            d
          ])}",
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
    );
    Get.back();
  }
}
