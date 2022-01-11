import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class NotificationsPage extends StatelessWidget {
  final logic = Get.put(NotificationsLogic());
  final state = Get.find<NotificationsLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Notifications")),
      body: Obx(() {
        return ListView(
          children: state.notifications
              .map(
                (element) => Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                  child: ListTile(
                    title: Text(element),
                    dense: false,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100)),
                    style: ListTileStyle.drawer,
                    tileColor: Colors.blueGrey[100],
                  ),
                ),
              )
              .toList(),
        );
      }),
    );
  }
}
