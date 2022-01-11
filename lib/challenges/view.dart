import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class ChallengesPage extends StatelessWidget {
  final logic = Get.put(ChallengesLogic());
  final state = Get.find<ChallengesLogic>().state;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ...state.challenges.map((e) => ListTile(
              title: Text(e.title),
              subtitle: Text(e.description),
              trailing: Obx(
                  () => Checkbox(value: e.completed.value, onChanged: (_) {})),
            ))
      ],
    );
  }
}
