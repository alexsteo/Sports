import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sports/organize_event/view.dart';

import 'logic.dart';

class FilterPage extends StatelessWidget {
  final logic = Get.put(FilterLogic());
  final state = Get.find<FilterLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filter"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Text("Select filtering options",
                style: TextStyle(fontSize: 20)),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Text("Event type",
                  style: TextStyle(fontSize: 16, color: Colors.grey)),
            ),
          ),
          ...sports.map(
            (e) => Obx(
              () => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(e),
                    Checkbox(
                        value: state.filter.categories.contains(e),
                        onChanged: (o) {
                          if (o!) {
                            state.filter.categories.add(e);
                          } else {
                            state.filter.categories.remove(e);
                          }
                        })
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Disabled friendly",
                    style: TextStyle(fontSize: 16, color: Colors.grey)),
                Obx(() {
                  return Checkbox(
                      value: state.filter.disabled.value,
                      onChanged: (o) => state.filter.disabled.toggle());
                })
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Location",
                    style: TextStyle(fontSize: 16, color: Colors.grey)),
                SizedBox(
                  width: Get.width * .5,
                  height: 50,
                  child: TextFormField(),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child:
                ElevatedButton(onPressed: Get.back, child: Text("Set filters")),
          )
        ],
      ),
    );
  }
}
