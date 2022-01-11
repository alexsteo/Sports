import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sports/auth/login/view.dart';
import 'package:sports/services/filter_service.dart';
import 'package:sports/services/events_service.dart';
import 'package:sports/services/user_service.dart';


void main() {
  Get.put(EventsService());
  Get.put(FilterService());
  Get.put(UserService());
  runApp(
    GetMaterialApp(
      title: "Application",
      home: LoginPage(),
    ),
  );
}
