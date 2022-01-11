import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sports/chat/view.dart';
import 'package:sports/participate/view.dart';
import 'package:sports/services/events_service.dart';
import 'package:sports/sponsor_event/view.dart';

import 'logic.dart';

class EventDetailsPage extends StatelessWidget {
  final logic = Get.put(EventDetailsLogic());
  final state = Get.find<EventDetailsLogic>().state;

  final Event event;

  EventDetailsPage(this.event);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(event.eventName),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () => Get.to(() => ChatPage()),
              icon: Icon(Icons.chat_bubble))
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.network(event.image),
          if (event.disabilityFriendly) Icon(Icons.wheelchair_pickup_sharp),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                formatDate(event.date, [yy, ' ', M, ' ', d]),
                style: TextStyle(fontSize: 20),
              ),
              Text(
                event.location,
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.people_sharp),
              SizedBox(width: 10),
              Text(
                "${event.minParticipants} - ${event.maxParticipants}",
                style: TextStyle(fontSize: 20),
              )
            ],
          ),
          Text(
            "Experience level  ${event.experienceLevel}",
            style: TextStyle(fontSize: 20),
          ),
          if (event.requiredEquipment != "")
            Text(
              "Required equipment  ${event.requiredEquipment}",
              style: TextStyle(fontSize: 20),
            ),
          if (event.paid)
            Text(
              "Fee: ${event.fee}",
              style: TextStyle(fontSize: 20),
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () => Get.to(() => ParticipatePage(event)),
                child: Text(
                  "Attend",
                ),
              ),
              ElevatedButton(
                onPressed: () => Get.to(() => SponsorEventPage(event)),
                child: Text(
                  "Sponsor event",
                ),
              ),
            ],
          ),
          SizedBox()
        ],
      ),
    );
  }
}
