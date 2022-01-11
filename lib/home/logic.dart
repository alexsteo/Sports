import 'package:get/get.dart';
import 'package:sports/filter/state.dart';
import 'package:sports/services/filter_service.dart';
import 'package:sports/services/events_service.dart';
import 'package:rxdart/rxdart.dart';

import 'state.dart';

class HomeLogic extends GetxController {
  final HomeState state = HomeState();

  HomeLogic() {
    MergeStream([
      FilterService.to.searchTerm.stream,
      FilterService.to.filter.stream
    ]).listen((_) {
      print(_);

      var filtered = EventsService.to.events.where((p0) => p0.eventName
          .toLowerCase()
          .contains(FilterService.to.searchTerm.toLowerCase()));

      if (FilterService.to.filter.value.disabled.value) {
        filtered = filtered.where((e) => e.disabilityFriendly);
      }
      if (FilterService.to.filter.value.categories.isNotEmpty) {
        filtered = filtered.where((e) =>
            FilterService.to.filter.value.categories.contains(e.eventType));
      }

      state.events.clear();

      state.events.addAll(filtered);
    });
  }
}
