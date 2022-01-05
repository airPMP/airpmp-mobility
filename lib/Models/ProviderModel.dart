import 'package:airpmp_mobility/API/ResourceClasses.dart';
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

  MyJobCard getJC(int index) {
    return _jobCardData.getJobCards[index];
  }

  ProviderModel(LoginDetails details) {
    _jobCardData.updateLogin(details);
  }

  Future<void> fetchJobCards() async {
    await _jobCardData.fetchJobCards();
  }

  Future<int> execute(MyJobCard jobCard) async {
    int i = await _jobCardData.execute(jobCard);
    getJobCards();
    return i;
  }

  Map<int, MyJobCard> getJobCards() {
    switch (stageSelection) {
      case Stage.Approved:
        return _jobCardData.getStatusCards("Executed");
      case Stage.In_Progress:
        return _jobCardData.getStatusCards("In-Progress");
      case Stage.Waiting:
        return _jobCardData.getStatusCards("Waiting-for-Approval");
      case Stage.Not_Started:
        return _jobCardData.getStatusCards("Not-started");
    }
  }

  Future<List<SingleResource>> getEquipments(Resource res) {
    return _jobCardData.fetchEquipments(res == Resource.Equipment);
  }

  ProjectDetails get getProjectDetails {
    return _jobCardData.getProjectDetails;
  }

  void putResources(int index, dynamic addResource) {
    _jobCardData.addResources(index, addResource);
    notifyListeners();
  }

  void fetchDesignations() {
    _jobCardData.fetchDesigs();
  }

  void updateQty(double qty, int index) {
    _jobCardData.updateQuatity(qty, index);
    notifyListeners();
  }
}
