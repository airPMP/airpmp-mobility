class MyJobCard {
  MyJobCard({this.activiyName, this.zone});
  String activiyName;
  String zone;
  String jcStatus;
  String activityCode;

  MyJobCard.fromJson(Map<String, dynamic> json) {
    activiyName = json['activityName'];
    zone = json['zone'];
    jcStatus = json['JCStatus'];
    activityCode = json['activityCode'];
  }
}
