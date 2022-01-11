import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sports/event_details/view.dart';
import 'package:sports/participate/view.dart';
import 'package:sports/services/events_service.dart';

class EventCard extends StatelessWidget {
  EventCard(this.event);

  final Event event;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(() => EventDetailsPage(event)),
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        margin: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(event.image, fit: BoxFit.fitWidth),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    event.eventName,
                    style: TextStyle(fontSize: 30),
                  ),
                  Text(
                    event.eventType,
                    style: TextStyle(fontSize: 24),
                  )
                ],
              ),
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FlatButton(
                  onPressed: () => Get.to(() => ParticipatePage(event)),
                  child: Text(
                    "Attend",
                    style: TextStyle(color: Colors.blue, fontSize: 18),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Visibility(
                    child: Icon(Icons.wheelchair_pickup_sharp),
                    visible: event.disabilityFriendly,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
