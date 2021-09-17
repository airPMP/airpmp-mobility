import 'package:airpmp_mobility/API/ApiClass.dart';
import 'package:airpmp_mobility/API/Functions.dart';
import 'package:airpmp_mobility/API/ResourceClasses.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoginDetails {
  int statuscode;
  String userid;
  String token;
  String company;
  LoginDetails(
      {required this.userid,
      required this.token,
      required this.company,
      this.statuscode = 200});

  static LoginDetails fromJson(jsonResponse) {
    return LoginDetails(
      userid: jsonResponse['user']['_id'],
      company: jsonResponse['user']['company'],
      token: jsonResponse['token'],
    );
  }
}

class SecureStorage {
  final _storage = FlutterSecureStorage();
  Future writeSecureData(String key, String value) async {
    var writeData = await _storage.write(key: key, value: value);
    return writeData;
  }

  Future readSecureData(String key) async {
    var readData = await _storage.read(key: key);
    return readData;
  }

  Future deleteSecureData(String key) async {
    var deleteData = await _storage.delete(key: key);
    return deleteData;
  }
}

// <==============================================================>

class MyJobCard {
  // MyJobCard({this.activiyName, this.zone});
  late String jobCardNumber;
  late String activiyName;
  late String zone;
  late String jcStatus;
  late String activityCode;
  // assingedDate is createdDate
  late String assignedDate;
  late String tobeAchievedQTY;
  late DateTime convertedCreatedDateTime;
  double achievedQTY = 0;
  List<ActualResource> actuals = [];
  List<PlannedvsActualResource> plannedvsactuals = [];
  // List<PlannedResource> plannedResource = [];
  // List<PlannedActualResource> plannedActualResource = [];
  // List<UnplannedResource> unplannedResource = [];

  MyJobCard.fromJson(Map<String, dynamic> json) {
    jobCardNumber = json['_id'] ?? "";
    activiyName = json['activityName'] ?? "";
    zone = json['zone'] ?? "";
    jcStatus = json['JCStatus'] ?? "";
    activityCode = json['activityCode'] ?? "";
    assignedDate = json['assignedDate'] ?? "";
    tobeAchievedQTY = json['tobeAchievedQTY'] ?? "";
    // convertedCreatedDateTime = DateTime.parse(assignedDate);
    actuals = List.generate((json['actuals'] ?? []).length,
        (index) => ActualResource.fromJson(json['actuals'][index]));
    plannedvsactuals = List.generate(
        (json['plannedVsAllowableVsActual'] ?? []).length,
        (index) => PlannedvsActualResource.fromJson(
            json['plannedVsAllowableVsActual'][index]));
    // List<Map<String, dynamic>> justplannedlist = (json['planned'] ?? [])
    //     .where((element) => (element['actualhours'] ?? 0) == 0);
    // plannedResource = List.generate(justplannedlist.length,
    //     (index) => PlannedResource.fromJson(justplannedlist[index]));

    // List<Map<String, dynamic>> plannedactuallist = (json['planned'] ?? [])
    //     .where((element) =>
    //         (element['actualhours'] ?? 0) > 0 &&
    //         !(element['unPlanned'] ?? false));
    // plannedResource = List.generate(plannedactuallist.length,
    //     (index) => PlannedResource.fromJson(plannedactuallist[index]));
    // List<Map<String, dynamic>> unplannedactuallist = (json['planned'] ?? [])
    //     .where((element) => (element['unPlanned'] ?? false));
    // plannedResource = List.generate(unplannedactuallist.length,
    //     (index) => PlannedResource.fromJson(unplannedactuallist[index]));
  }
  // fg(){List ij = actuals.where((element) =>element[])}
}
// <==============================================================>

// <==============================================================>

class MyProject {
  MyProject({required this.name, required this.id, required this.active});
  late String id;
  late String name;
  late bool active;

  MyProject.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['_id'];
    active = json['active'];
  }
}

class JobCardData {
  List<MyJobCard> _myJobCards = [];
  String _token = '';

  Future getJobCards() async {
    _myJobCards = await ApiClass().getMyJobCard(_token) ?? [];
  }

  Future addResources() async {
    await ApiClass().addResources(_myJobCards[0], _token);
  }

  void updateToken(String token) {
    _token = token;
  }

  List<MyJobCard> getInProgressJobCard(String token) {
    print('geting in progress jsc');
    List<MyJobCard> inProgressList = [];

    for (MyJobCard aJC in _myJobCards) {
      if (aJC.jcStatus == "In-Progress") {
        inProgressList.add(aJC);
      }
    }
    return inProgressList;
  }

  List<MyJobCard> getExecutedJobCard(String token) {
    print('geting in progress jsc');
    List<MyJobCard> inProgressList = [];
    for (MyJobCard aJC in _myJobCards) {
      if (aJC.jcStatus == "Executed") {
        inProgressList.add(aJC);
      }
    }
    return inProgressList;
  }
}
