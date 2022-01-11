import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sports/services/events_service.dart';

import 'logic.dart';

class SponsorEventPage extends StatelessWidget {
  final logic = Get.put(SponsorEventLogic());
  final state = Get.find<SponsorEventLogic>().state;

  final Event event;

  SponsorEventPage(this.event);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sponsor ${event.eventName}"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            width: Get.width * .8,
            child: Text(
              "You are about to make an offer to the event ${event.eventName}.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: Get.width * .65,
                child: Text("Enter the amount you want to pay"),
              ),
              SizedBox(
                width: Get.width * .25,
                child: TextFormField(
                  keyboardType: TextInputType.number,
                ),
              ),
              Text("\$"),
            ],
          ),
          Text("The event organizer will contact you about the details"),
          ElevatedButton(
            onPressed: Get.back,
            child: Text(
              "Submit",
            ),
          ),
        ],
      ),
    );
  }
}
