import 'package:flutter_secure_storage/flutter_secure_storage.dart';

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

class SecureStorage{
  final _storage = FlutterSecureStorage();
  Future writeSecureData(String key, String value)  async {
    var writeData = await _storage.write(key: key, value: value);
    return writeData;
  }
  Future readSecureData(String key) async {
    var readData = await _storage.read(key: key);
    return readData;
  }
  Future deleteSecureData(String key) async{
    var deleteData = await _storage.delete(key: key);
    return deleteData;
  }
}