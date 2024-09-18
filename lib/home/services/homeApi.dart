import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:thaicancerfree/constants.dart';
import 'package:thaicancerfree/models/district.dart';
import 'package:thaicancerfree/models/estimates.dart';
import 'package:thaicancerfree/models/evaluation.dart';

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
      return data['message'];
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
      required String hospital_id}) async {
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
          "hospital_id": hospital_id
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
}
