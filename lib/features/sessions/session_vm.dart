import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sikada/features/reservation/myReservations.dart';
import 'package:sikada/features/sessions/car/car.dart';
import 'package:sikada/features/sessions/sessionpage.dart';

// Session states
enum SessionState { firstTime, carAdded, carParked }

class SessionVM extends GetxController {
  // reactive state
  final sessionState = SessionState.firstTime.obs;

  // Methods to change state
  void setFirstTime() => sessionState.value = SessionState.firstTime;
  void setCarAdded() => sessionState.value = SessionState.carAdded;
  void setCarParked() => sessionState.value = SessionState.carParked;

  // ✅ Function to return page depending on state
  Widget getPage() {
    switch (sessionState.value) {
      case SessionState.firstTime:
        return const Sessionspage();
      case SessionState.carAdded:
        return const Carpage();
      case SessionState.carParked:
        return const Myreservations();
    }
  }
}
