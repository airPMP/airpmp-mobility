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
  late String projectID;
  late double spi, cpi;
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
  MyJobCard();
  MyJobCard.fromJson(Map<String, dynamic> json) {
    jobCardNumber = json['_id'] ?? "";
    activiyName = json['activityName'] ?? "";
    zone = json['zone'] ?? "";
    jcStatus = json['JCStatus'] ?? "";
    activityCode = json['activityCode'] ?? "";
    assignedDate = json['assignedDate'] ?? "";
    tobeAchievedQTY = json['tobeAchievedQTY'] ?? "";
    projectID = json['projectId'] ?? "";
    spi = json['spi'] ?? 0;
    cpi = json['cpi'] ?? 0;
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
  LoginDetails _loginDetails = LoginDetails(userid: "", token: "", company: "");
  ProjectDetails _projectDetails = ProjectDetails();
  Future fetchJobCards() async {
    _myJobCards = await ApiClass()
            .getMyJobCard(_loginDetails.token, _loginDetails.userid) ??
        [];
    if (_myJobCards.length > 0)
      _projectDetails = await ApiClass().getMyProject(_loginDetails.token,
              _myJobCards[0].projectID, _loginDetails.company) ??
          ProjectDetails();
  }

  Future addResources() async {
    await ApiClass().addResources(_myJobCards[0], _loginDetails.token);
  }

  ProjectDetails get getProjectDetails {
    return _projectDetails;
  }

  List<MyJobCard> get getJobCards {
    return _myJobCards;
  }

  void updateLogin(LoginDetails details) {
    _loginDetails = details;
  }

  List<MyJobCard> getStatusCards(String status) {
    print('geting in progress jsc');
    List<MyJobCard> list = [];

    for (MyJobCard aJC in _myJobCards) {
      print(aJC.jcStatus + " " + status);
      if (aJC.jcStatus == status) {
        list.add(aJC);
      }
    }
    return list;
  }
}

class ProjectDetails {
  String projectName = "",
      clientName = "",
      projectDescription = "",
      projectId = "";
  ProjectDetails(
      {this.projectName = "",
      this.clientName = "",
      this.projectDescription = "",
      this.projectId = ""});

  ProjectDetails.fromJson(Map json) {
    projectName = json['name'] ?? "";
    clientName = json['client']['name'] ?? "";
    projectDescription = json['description'] ?? "";
    projectId = json['_id'];
  }
}
