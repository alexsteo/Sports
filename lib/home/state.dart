import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:sports/services/filter_service.dart';
import 'package:sports/services/events_service.dart';

class HomeState {
  RxList<Event> events = <Event>[].obs;

  final search = "".obs;

  HomeState() {
    search.stream.listen((event) {
      FilterService.to.searchTerm.value = event;
    });
    events = [...EventsService.to.events].obs;
  }
}
