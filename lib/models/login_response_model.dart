class LoginDetails {
  LoginDetails({this.token, this.statusCode, this.companyID, this.userID});

  String token;
  String statusCode;
  String companyID;
  String userID;

  LoginDetails.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    companyID = json['user']['company'];
    userID = json['user']['_id'];
  }
}
