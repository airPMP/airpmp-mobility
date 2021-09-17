import 'package:airpmp_mobility/Constants/Classes.dart';
import 'package:airpmp_mobility/Constants/Enums.dart';
import 'package:flutter/material.dart';

class ProviderModel extends ChangeNotifier {
  Stage stageSelection = Stage.Not_Started;
  JobCardData _jobCardData = JobCardData();

  void changeStage(Stage st) {
    stageSelection = st;
    notifyListeners();
  }

  ProviderModel(LoginDetails details) {
    _jobCardData.updateLogin(details);
  }

  Future<void> fetchJobCards() async {
    await _jobCardData.getJobCards();
  }
}
