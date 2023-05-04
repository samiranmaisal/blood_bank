import 'dart:convert';
import 'package:blood_bank_app/src/BloodBank.dart';
import 'package:http/http.dart';

import 'BloodStock.dart';
class HttpService {
  String base_url = "http://103.107.66.207:8080/api/";

Future<List<BloodBank>> getBloodBanks(String Rec_Type)   async {
    Map data = {
      'Rec_type': Rec_Type,
    };
    String body = json.encode(data);
    Response res = await post(Uri.parse(base_url + "BLOOD_BANK"),body: body,headers: {"Content-Type": "application/json"});

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      List<BloodBank> posts = body
          .map(
            (dynamic item) => BloodBank.fromJson(item),
      )
          .toList();

      return posts;
    } else {
      throw "Unable to retrieve blood banks.";
    }
  }
  Future<List<BloodStock>> getBloodStock(String Branch_ID)   async {
    Map data = {
      'Branch_ID': Branch_ID,
    };
    String body = json.encode(data);
    Response res = await post(Uri.parse(base_url + "BLOOD_STOCK"),body: body,headers: {"Content-Type": "application/json"});

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      List<BloodStock> posts = body
          .map(
            (dynamic item) => BloodStock.fromJson(item),
      )
          .toList();

      return posts;
    } else {
      throw "Unable to retrieve blood stocks.";
    }
  }
}