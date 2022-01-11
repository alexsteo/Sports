import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sports/challenges/view.dart';
import 'package:sports/filter/view.dart';
import 'package:sports/map/view.dart';
import 'package:sports/notifications/view.dart';
import 'package:sports/organize_event/view.dart';
import 'package:sports/profile/view.dart';
import 'package:sports/services/events_service.dart';
import 'package:sports/widgets/event_card.dart';

import 'logic.dart';

class HomePage extends StatelessWidget {
  final logic = Get.put(HomeLogic());
  final state = Get.find<HomeLogic>().state;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Events"),
          actions: [
            IconButton(
                onPressed: () => Get.to(() => NotificationsPage()),
                icon: Icon(Icons.notifications)),
            IconButton(
                onPressed: () => Get.to(() => OrganizeEventPage()),
                icon: Icon(Icons.add)),
            IconButton(
                onPressed: () => Get.to(() => MapPage()), icon: Icon(Icons.map))
          ],
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.sports_tennis_sharp)),
              Tab(icon: Icon(Icons.star_half_outlined)),
              Tab(icon: Icon(Icons.person)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15, left: 15),
                  child: Row(
                    children: [
                      Expanded(
                        child: CupertinoSearchTextField(
                            padding: EdgeInsets.all(8),
                            onChanged: (it) => state.search.value = it),
                      ),
                      IconButton(
                          onPressed: () => Get.to(() => FilterPage()),
                          icon: Icon(
                            Icons.filter_list,
                            color: Colors.black54,
                          ))
                    ],
                  ),
                ),
                Expanded(
                  child: Obx(() => ListView(
                        shrinkWrap: true,
                        children: state.events.value.map((it) => EventCard(it)).toList(),
                      )),
                ),
              ],
            ),
            ChallengesPage(),
            ProfilePage(),
          ],
        ),
      ),
    );
  }
}
