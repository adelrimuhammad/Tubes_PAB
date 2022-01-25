import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:penkar/models/karyawan_model.dart';

class KaryawanProvider with ChangeNotifier {
  late KaryawanModel _karyawan;

  KaryawanModel get karyawan => _karyawan;

  set karyawan(KaryawanModel newKaryawan) {
    _karyawan = newKaryawan;
    notifyListeners();
  }

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

  static Future<KaryawanModel?> tambah(
      String name,
      String jabatan,
      String nik,
      String tgl_lahir,
      String no_tlp,
      String status,
      String tahun_bergabung) async {
    try {
      var body = {
        'name': name,
        'jabatan': jabatan,
        'nik': nik,
        'tgl_lahir': tgl_lahir,
        'no_tlp': no_tlp,
        'status': status,
        'tahun_bergabung': tahun_bergabung,
      };

      var response = await http.post(
        Uri.parse('https://tubes-penkar.herokuapp.com/api/employee'),
        body: body,
      );

      print(response.statusCode);
      print(response.body);

      if (response.statusCode == 200) {
        return KaryawanModel.fromJson(jsonDecode(response.body));
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }
}
