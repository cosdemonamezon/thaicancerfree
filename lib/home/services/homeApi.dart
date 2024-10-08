import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:thaicancerfree/constants.dart';
import 'package:thaicancerfree/models/district.dart';
import 'package:thaicancerfree/models/estimates.dart';
import 'package:thaicancerfree/models/evaluation.dart';
import 'package:thaicancerfree/models/provinces.dart';

class HomeApi {
  const HomeApi();

  //เรียกข้อมูลหัวข้อประเมิน
  static Future<List<Evaluation>> getEstimated() async {
    final url = Uri.https(publicUrl, '/thaicancel/public/api/get_estimate');
    var headers = {'Content-Type': 'application/json'};
    final response = await http.get(
      headers: headers,
      url,
    );
    if (response.statusCode == 200) {
      final data = convert.jsonDecode(response.body);
      final list = data['data'] as List;
      return list.map((e) => Evaluation.fromJson(e)).toList();
    } else {
      final data = convert.jsonDecode(response.body);
      throw Exception(data['message']);
    }
  }

  //ทำแบบประเมิน
  static Future takeAssessment({required List<Estimates> estimates}) async {
    final url = Uri.https(publicUrl, '/thaicancel/public/api/estimate_check');
    var headers = {'Content-Type': 'application/json'};
    final response = await http.post(
        headers: headers,
        url,
        body: convert.jsonEncode({
          "estimates": estimates,
        }));
    if (response.statusCode == 200 || response.statusCode == 201) {
      final data = convert.jsonDecode(response.body);
      return data['data'];
    } else {
      final data = convert.jsonDecode(response.body);
      throw Exception(data['message']);
    }
  }

  //เพิ่มสมาชิก
  static Future addMembers(
      {required String fname,
      required String lname,
      required String idcard,
      required String email,
      required String phone,
      required String address,
      required String sex,
      required String birthday,
      required String khet_id,
      required String province_id,
      required String hospital_id,
      required String code}) async {
    final url = Uri.https(publicUrl, '/thaicancel/public/api/member');
    var headers = {'Content-Type': 'application/json'};
    final response = await http.post(
        headers: headers,
        url,
        body: convert.jsonEncode({
          "fname": fname,
          "lname": lname,
          "idcard": idcard,
          "email": email,
          "phone": phone,
          "address": address,
          "sex": sex,
          "birthday": birthday,
          "khet_id": khet_id,
          "province_id": province_id,
          "hospital_id": hospital_id,
          "code": code
        }));
    if (response.statusCode == 200 || response.statusCode == 201) {
      final data = convert.jsonDecode(response.body);
      return data['message'];
    } else {
      final data = convert.jsonDecode(response.body);
      throw Exception(data['message']);
    }
  }

  //เรียกข้อมูลเขต
  static Future<List<District>> getListKhet() async {
    final url = Uri.https(publicUrl, '/thaicancel/public/api/get_khet');
    var headers = {'Content-Type': 'application/json'};
    final response = await http.get(
      headers: headers,
      url,
    );
    if (response.statusCode == 200) {
      final data = convert.jsonDecode(response.body);
      final list = data['data'] as List;
      return list.map((e) => District.fromJson(e)).toList();
    } else {
      final data = convert.jsonDecode(response.body);
      throw Exception(data['message']);
    }
  }

  //เรียกข้อมูลเขต By id
  static Future<District> getKhetById({required String khet_id}) async {
    final url = Uri.https(publicUrl, '/thaicancel/public/api/khet/$khet_id');
    var headers = {'Content-Type': 'application/json'};
    final response = await http.get(
      headers: headers,
      url,
    );
    if (response.statusCode == 200) {
      final data = convert.jsonDecode(response.body);
      return District.fromJson(data['data']);
    } else {
      final data = convert.jsonDecode(response.body);
      throw Exception(data['message']);
    }
  }

  //เรียกดูยอดวิว
  static Future getViews() async {
    final url = Uri.https(publicUrl, '/thaicancel/public/api/get_views');
    var headers = {'Content-Type': 'application/json'};
    final response = await http.get(
      headers: headers,
      url,
    );
    if (response.statusCode == 200) {
      final data = convert.jsonDecode(response.body);
      return data['data'];
    } else {
      final data = convert.jsonDecode(response.body);
      throw Exception(data['message']);
    }
  }

  //เก็ทข้อมูลจังหวัดเพื่อเอาไปเปรียบเทียบ
  static Future<List<Provinces>> getProvince() async {
    final url = Uri.https(publicUrl, '/thaicancel/public/api/province_page');
    var headers = {'Content-Type': 'application/json'};
    final response = await http.post(
        headers: headers,
        url,
        body: convert.jsonEncode({
          "draw": 1,
          "order": [
            {"column": 0, "dir": "asc"}
          ],
          "start": 0,
          "length": 100,
          "search": {"value": "", "regex": false}
        }));
    if (response.statusCode == 200 || response.statusCode == 201) {
      final data = convert.jsonDecode(response.body);
      final list = data['data']['data'] as List;
      return list.map((e) => Provinces.fromJson(e)).toList();
    } else {
      final data = convert.jsonDecode(response.body);
      throw Exception(data['message']);
    }
  }
}
