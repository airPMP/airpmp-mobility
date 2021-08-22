class LoginDetails {
 
  String userid;
  String token;
  String company;
  LoginDetails({required this.userid, required this.token, required this.company});

  static LoginDetails fromJson(jsonResponse) {
    return LoginDetails(
      userid: jsonResponse['user']['_id'],
      company: jsonResponse['user']['company'],
      token: jsonResponse['token'],
    );
  }
}
