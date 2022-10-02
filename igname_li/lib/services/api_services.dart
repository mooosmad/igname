// ignore_for_file: depend_on_referenced_packages, prefer_typing_uninitialized_variables, unnecessary_string_interpolations, avoid_print, prefer_const_declarations

import 'package:http/http.dart' as http;
import 'package:igname_li/models/user.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class Apiservices {
  String serverUrl = "https://iwadeli.herokuapp.com/api";
  var status;

  var token;

  Future getDataUser() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'access_token';
    final value = prefs.get(key) ?? 0;

    String myUrl = "$serverUrl/me";
    http.Response response = await http.post(Uri.parse(myUrl), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $value'
    });
    print(response.body);
    final Map<String, dynamic> data = json.decode(response.body);
    // return json.decode(response.body);
    return User.fromMap(data);
  }

  Future<List<dynamic>?> loginUser(String contact, String password) async {
    String myUrl = "$serverUrl/login";
    List<dynamic>? check;
    final response = await http.post(
      Uri.parse(myUrl),
      headers: {'Accept': 'application/json'},
      body: {"contact": "$contact", "password": "$password"},
    );
    status = response.body.contains('error');

    var data = json.decode(response.body);

    if (status) {
      print('data : ${data["message"]}');
      check = [false, '${data["message"]}'];
    } else {
      if (data["access_token"] == null) {
        print("${data["message"]}");
        check = [false, '${data["message"]}'];
      } else {
        print('data : ${data["access_token"]}');
        _save(data["access_token"]);
        check = [true, "${data["message"]}"];
      }
    }
    return check;
  }

  Future<List<dynamic>?> registerUser(
      String nom, String prenom, String contact, String password) async {
    String myUrl = "$serverUrl/register";
    List<dynamic>? check;
    final response = await http.post(
      Uri.parse(myUrl),
      headers: {'Accept': 'application/json'},
      body: {
        "nom": "$nom",
        "prenom": "$prenom",
        "contact": "$contact",
        "password": "$password"
      },
    );
    status = response.body.contains('error');

    var data = json.decode(response.body);

    // if (status == 200) {
    //   print('data : ${data["token"]}');
    //   check = [true, "reussi"];
    //   _save(data["token"]);
    //   //
    // } else {
    //   print('dataerror: ${data["error"]}');
    //   check = [false, '${data["error"]}'];
    //   Fluttertoast.showToast(msg: "${data["error"]}");
    // }

    if (status) {
      print('data : ${data["message"]}');
      check = [false, '${data["message"]}'];
    } else {
      print('data : ${data["access_token"]}');
      _save(data["access_token"]);
      // await box.put(
      //   'users',
      //   User(nom: nom, prenom: prenom, contact: contact, password: password),
      // );
      // print(box.get('users'));
      check = [true, "${data["message"]}"];
    }

    return check;
  }

  _save(String token) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'access_token';
    final value = token;
    prefs.setString(key, value);
  }

  Future<List<dynamic>?> logout() async {
    String myUrl = "$serverUrl/logout";
    List<dynamic>? check;
    final response = await http.post(
      Uri.parse(myUrl),
      headers: {'Accept': 'application/json'},
    );
    status = response.body.contains('error');

    var data = json.decode(response.body);

    if (status) {
      print('data : ${data["error"]}');
      check = [false, '${data["error"]}'];
    } else {
      print('data : ${data["access_token"]}');
      check = [true, "${data["message"]}"];
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.remove('access_token');
    }
    return check;
  }

  // Future<List> getData() async{

  //   final prefs = await SharedPreferences.getInstance();
  //   final key = 'token';
  //   final value = prefs.get(key ) ?? 0;

  //   String myUrl = "$serverUrl/products/";
  //   http.Response response = await http.get(myUrl,
  //       headers: {
  //         'Accept':'application/json',
  //         'Authorization' : 'Bearer $value'
  //   });
  //   return json.decode(response.body);
  // }

  // void deleteData(int id) async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final key = 'token';
  //   final value = prefs.get(key ) ?? 0;

  //   String myUrl = "$serverUrl/products/$id";
  //   http.delete(myUrl,
  //       headers: {
  //         'Accept':'application/json',
  //         'Authorization' : 'Bearer $value'
  //   } ).then((response){
  //     print('Response status : ${response.statusCode}');
  //     print('Response body : ${response.body}');
  //   });
  // }

  // void addData(String name , String price) async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final key = 'token';
  //   final value = prefs.get(key ) ?? 0;

  //   String myUrl = "$serverUrl/products";
  //   http.post(myUrl,
  //       headers: {
  //         'Accept':'application/json',
  //         'Authorization' : 'Bearer $value'
  //       },
  //       body: {
  //         "name": "$name",
  //         "price" : "$price"
  //       }).then((response){
  //     print('Response status : ${response.statusCode}');
  //     print('Response body : ${response.body}');
  //   });
  // }

  // void editData(int id,String name , String price) async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final key = 'token';
  //   final value = prefs.get(key ) ?? 0;

  //   String myUrl = "http://flutterapitutorial.codeforiraq.org/api/products/$id";
  //   http.put(myUrl,
  //       headers: {
  //         'Accept':'application/json',
  //         'Authorization' : 'Bearer $value'
  //       },
  //       body: {
  //         "name": "$name",
  //         "price" : "$price"
  //       }).then((response){
  //     print('Response status : ${response.statusCode}');
  //     print('Response body : ${response.body}');
  //   });
  // }

//  read() async {
//     final prefs = await SharedPreferences.getInstance();
//     final key = 'token';
//     final value = prefs.get(key ) ?? 0;
//     print('read : $value');
//   }

}
