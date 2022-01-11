import 'package:get/get.dart';

import '../organize_event/view.dart';

class Event {
  String image = "";
  String eventName = "";
  String eventType = sports[0];
  String location = "";
  DateTime date = DateTime.now();
  int minParticipants = 0;
  int maxParticipants = 10;
  String requiredEquipment = "";
  String experienceLevel = experienceLevels[0];
  bool paid = false;
  double fee = 9.9;
  bool disabilityFriendly = false;

  Event(
      this.image,
      this.eventName,
      this.eventType,
      this.location,
      this.date,
      this.minParticipants,
      this.maxParticipants,
      this.requiredEquipment,
      this.experienceLevel,
      this.paid,
      this.fee,
      this.disabilityFriendly);
}

class EventsService {
  static EventsService get to => Get.find();

  RxList<Event> events = <Event>[].obs;

  EventsService() {
    events.add(Event(
        "https://image.cnbcfm.com/api/v1/image/106869987-1618795805885-gettyimages-1312630032-sb3_5306_2021041510407047.jpeg?v=1618795885",
        "Football",
        sports[0],
        "Cluj",
        DateTime.now(),
        2,
        10,
        "",
        experienceLevels[2],
        false,
        0.0,
        false));
    events.add(Event(
        "https://assets.chicagoparkdistrict.com/s3fs-public/styles/16_9_50_width/public/images/facilities/chess.jpg?itok=yFV-wavs",
        "Chess in the park",
        sports[2],
        "Cluj",
        DateTime.now(),
        2,
        2,
        "",
        experienceLevels[3],
        true,
        10.0,
        true));
    events.add(Event(
        "https://i.eurosport.com/2021/08/07/3196981-65494888-2560-1440.jpg",
        "La un cos",
        sports[1],
        "Cluj",
        DateTime.now(),
        2,
        10,
        "",
        experienceLevels[1],
        false,
        0.0,
        false));
  }
}
