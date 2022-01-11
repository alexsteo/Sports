import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'logic.dart';

const sports = [
  "Football",
  "Basketball",
  "Chess",
  "Tennis",
  "Cards",
];
const experienceLevels = [
  "Beginner",
  "Intermediate",
  "Advanced",
  "Expert",
];

class OrganizeEventPage extends StatelessWidget {
  final logic = Get.put(OrganizeEventLogic());
  final state = Get.find<OrganizeEventLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Organize new event"),
      ),
      body: ListView(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: Text("Image Link"),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Container(
                  width: 150,
                  height: 40,
                  child: TextFormField(
                    onChanged: (it) => state.image.value = it,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: Text("Event Name"),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Container(
                  width: 150,
                  height: 40,
                  child: TextFormField(
                    onChanged: (it) => state.eventName.value = it,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: Text("Event type"),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Obx(() {
                  return DropdownButton(
                      value: state.eventType.value,
                      items: sports
                          .map((e) => DropdownMenuItem(
                                child: Text(e),
                                value: e,
                              ))
                          .toList(),
                      onChanged: (it) => state.eventType.value = it.toString());
                }),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: Text("Location"),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Container(
                  width: 150,
                  height: 40,
                  child: TextFormField(
                    onChanged: (it) => state.location.value = it,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: Text("Date and time"),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(15),
                child: InkWell(
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Obx(() => Text(
                        formatDate(state.date.value, [yy, '-', M, '-', d]))),
                  ),
                  onTap: () => DatePicker.showDatePicker(
                    context,
                    showTitleActions: true,
                    minTime: DateTime.now(),
                    maxTime: DateTime.now().add(365.days),
                    onConfirm: (date) {
                      state.date.value = date;
                    },
                    currentTime: DateTime.now(),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: Text("Minimum participants"),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Container(
                  width: 150,
                  height: 40,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    onChanged: (it) =>
                        state.minParticipants.value = int.parse(it),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: Text("Maximum participants"),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Container(
                  width: 150,
                  height: 40,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    onChanged: (it) =>
                        state.maxParticipants.value = int.parse(it),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: Text("Required equipment"),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Container(
                  width: 150,
                  height: 40,
                  child: TextFormField(
                    onChanged: (it) => state.requiredEquipment.value = it,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: Text("Experience level required"),
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
                child: Text("Paid"),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Obx(() => Checkbox(
                    value: state.paid.value,
                    onChanged: (_) => state.paid.toggle())),
              ),
            ],
          ),
          Obx(() {
            if (state.paid.value) {
              return Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Text("Fee"),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Container(
                      width: 150,
                      height: 40,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        onChanged: (it) => state.fee.value = double.parse(it),
                      ),
                    ),
                  ),
                ],
              );
            }
            return Container();
          }),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: Text("Disability friendly"),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Obx(() => Checkbox(
                    value: state.disabilityFriendly.value,
                    onChanged: (_) => state.disabilityFriendly.toggle())),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: ElevatedButton(
                onPressed: logic.addEvent, child: Text("Create event")),
          )
        ],
      ),
    );
  }
}
