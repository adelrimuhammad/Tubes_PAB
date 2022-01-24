import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:penkar/models/karyawan_model.dart';

class KaryawanProvider with ChangeNotifier {
  Future<List<KaryawanModel>> getKaryawans() async {
    try {
      var response = await http.get(
        Uri.parse('https://tubes-penkar.herokuapp.com/api/employee'),
      );
      print(response.statusCode);
      print(response.body);

      if (response.statusCode == 200) {
        List<KaryawanModel> karyawans = [];
        List parsedJson = jsonDecode(response.body);

        parsedJson.forEach((Karyawan) {
          karyawans.add(KaryawanModel.fromJson(Karyawan));
        });
        return karyawans;
      } else {
        return [];
      }
    } catch (e) {
      print(e);
      return [];
    }
  }
}
