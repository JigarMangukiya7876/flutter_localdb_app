import 'dart:convert';
import 'package:http/http.dart' as http;

List<UserData> parseUsers(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<UserData>((json) => UserData.fromJson(json)).toList();
}

class UserData {
  String sId;
  String picture;
  String birthday;
  String name;
  String gender;
  String company;
  String email;
  String phone;
  String address;

  UserData(
      {this.sId,
      this.picture,
      this.birthday,
      this.name,
      this.gender,
      this.company,
      this.email,
      this.phone,
      this.address});

  UserData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    picture = json['picture'];
    birthday = json['birthday'];
    name = json['name'];
    gender = json['gender'];
    company = json['company'];
    email = json['email'];
    phone = json['phone'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['picture'] = this.picture;
    data['birthday'] = this.birthday;
    data['name'] = this.name;
    data['gender'] = this.gender;
    data['company'] = this.company;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['address'] = this.address;
    return data;
  }
}
