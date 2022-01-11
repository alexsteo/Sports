import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sports/chat/message_model.dart';
import 'package:sports/services/user_service.dart';

import 'logic.dart';

class ProfilePage extends StatelessWidget {
  final logic = Get.put(ProfileLogic());
  final state = Get.find<ProfileLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(15),
          child: Text("Hello, ${UserService.to.username}",
              style: TextStyle(fontSize: 20)),
        ),
        Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Disabled",
                  style: TextStyle(fontSize: 16, color: Colors.grey)),
              Obx(() {
                return Checkbox(
                    value: UserService.to.disabled.value,
                    onChanged: (o) => UserService.to.disabled.toggle());
              })
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Phone number",
                  style: TextStyle(fontSize: 16, color: Colors.grey)),
              SizedBox(
                width: Get.width * .4,
                height: 50,
                child: TextFormField(
                  initialValue: "07648773645",
                  keyboardType: TextInputType.phone,
                  onChanged: (e) => UserService.to.phoneNumber.value = e,
                ),
              )
            ],
          ),
        ),
        ExpansionTile(
          title: Text("Past events"),
          children: UserService.to.events
              .map((e) => ListTile(
                    title: Text(e.eventName),
                    trailing: Text(
                      formatDate(e.date, [yy, ' ', M, ' ', d]),
                    ),
                  ))
              .toList(),
        ),
        ExpansionTile(
          title: Text("Friend list"),
          children: favorites
              .map((e) => ListTile(
            leading: CircleAvatar(child: Image.network(e.imageUrl),),
                    title: Text(e.name),
                  ))
              .toList(),
        ),
      ],
    );
  }
}
