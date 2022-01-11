import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sports/organize_event/view.dart';
import 'package:sports/services/events_service.dart';

import 'logic.dart';

class ParticipatePage extends StatelessWidget {
  final logic = Get.put(ParticipateLogic());
  final state = Get.find<ParticipateLogic>().state;

  final Event event;

  ParticipatePage(this.event);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(event.eventName)),
      body: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: Text("Questions / Details"),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Container(
                  width: 150,
                  height: 40,
                  child: TextFormField(
                    onChanged: (it) => state.questions.value = it,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: Text("Experience level"),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Obx(() {
                  return DropdownButton(
                      value: state.experienceLevel.value,
                      items: experienceLevels
                          .map((e) => DropdownMenuItem(
                                child: Text(e),
                                value: e,
                              ))
                          .toList(),
                      onChanged: (it) =>
                          state.experienceLevel.value = it.toString());
                }),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: Text("Carpooling friendly"),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Obx(() => Checkbox(
                    value: state.carpool.value,
                    onChanged: (_) => state.carpool.toggle())),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
                child: Text("Share phone number"),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
                child: Obx(() => Checkbox(
                    value: state.phone.value,
                    onChanged: (_) => state.phone.toggle())),
              ),
            ],
          ),
          Obx(() => Visibility(
              visible: state.phone.value,
              child: Center(
                child: Text(
                  "We will provide this information from your profile.",
                  style: TextStyle(fontSize: 10, color: Colors.grey),
                ),
              ))),
          Spacer(flex: 2),
          Padding(
            padding: const EdgeInsets.all(15),
            child: ElevatedButton(
                onPressed: () => logic.participate(event),
                child: Text("Participate")),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
