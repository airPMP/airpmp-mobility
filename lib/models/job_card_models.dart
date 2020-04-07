class MyJobCard {
  // MyJobCard({this.activiyName, this.zone});
  String jobCardNumber;
  String activiyName;
  String zone;
  String jcStatus;
  String activityCode;
  // assingedDate is createdDate
  String assignedDate;
  String tobeAchievedQTY;
  DateTime convertedCreatedDateTime;

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
