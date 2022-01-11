import 'package:get/get.dart';

class Challenge {
  final String title;
  final String description;
  final RxBool completed;

  Challenge(this.title, this.description, this.completed);
}

class ChallengesState {
  final RxList<Challenge> challenges = <Challenge>[
    Challenge("1st event", "Participate in your first event", true.obs),
    Challenge("5 events", "Participate in 5 events", false.obs),
    Challenge("5 events", "Participate in 5 events", false.obs),
  ].obs;
}
