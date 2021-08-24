import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoginDetails {
  String userid;
  String token;
  String company;
  LoginDetails(
      {required this.userid, required this.token, required this.company});

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

  MyJobCard.fromJson(Map<String, dynamic> json) {
    jobCardNumber = json['_id'];
    activiyName = json['activityName'];
    zone = json['zone'];
    jcStatus = json['JCStatus'];
    activityCode = json['activityCode'];
    assignedDate = json['assignedDate'];
    tobeAchievedQTY = json['tobeAchievedQTY'];
    convertedCreatedDateTime = DateTime.parse(assignedDate);
    
  }
}
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
