import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:bps_tracking/model/user.dart';
SharedPreferences preferences;
//Future<SharedPreferences> preferences = SharedPreferences.getInstance();

class ApiService extends HttpOverrides {
  String apiUrl = "http://34.87.91.242/";
  Client client = Client();
  //HttpClient httpClient = new HttpClient();
  //httpClient.badCertificateCallback = ((X509Certificate cert, String host, int port) => true);

  ClientException clientException = ClientException("error");

  void savePref(String nama, String token, String email) async {
    preferences = await SharedPreferences.getInstance();
    preferences.setBool("isLoggedIn", true);
    preferences.setBool("setNotif", false);
    preferences.setString("nama", nama);
    preferences.setString("email", email);
    preferences.setString("token", token);
    preferences.commit();

  }

  Future<String> loginUser(User data) async {
    var response = await client.post(
      "$apiUrl/auth/login",
      headers: {"content-type": "application/json"},
      body: userToJson(data),
    );
    debugPrint(response.statusCode.toString());
    debugPrint(response.body);

    if (response.statusCode == 200) {
      // User dataMhs = userFromJson(response.body);
      Data metaData = userFromJson(response.body).data;
      savePref(metaData.name, metaData.token, metaData.email);
      return userFromJson(response.body).status;
    } else {
      return "failed";
    }
  }

  Future<bool> logoutUser() async {
    preferences = await SharedPreferences.getInstance();
    var token = preferences.getString('token');
    var response = await client.post(
      "$apiUrl/logout",
      headers: {"Authorization": "Bearer $token"},
    );
    debugPrint(response.statusCode.toString());
    debugPrint(response.body);

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  /* Future<Biodata> getBiodata() async {
    preferences = await SharedPreferences.getInstance();
    var token = preferences.getString('token');
    
    var response = await client.get(
      "$apiUrl/biodata",
      headers: {"Authorization": "Bearer $token"},
    );
    debugPrint("status code : " + response.statusCode.toString());
    debugPrint(response.body);
    if(response.statusCode == 200){
      return Biodata.fromJson(response.body);
    }else{
      return null;
    }
  }

  Future<List<DataJadwal>> getJadwalHarian() async {
    preferences = await SharedPreferences.getInstance();
    var token = preferences.getString('token');
    final response = await client.get(
        "$apiUrl/jadwal-hari-ini",
        headers: {"Authorization": "Bearer $token"});
    debugPrint("status code : " + response.statusCode.toString());
    debugPrint(response.body);
    //debugPrint("token pref : "+token);

    List<DataJadwal> hasil = Jadwal.fromJson(response.body).data;
    return hasil;
  } */

}