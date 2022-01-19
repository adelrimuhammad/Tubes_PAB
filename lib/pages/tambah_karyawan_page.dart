import 'package:flutter/material.dart';
import 'package:penkar/themes.dart';

class TambahKaryawanPage extends StatefulWidget {
  @override
  State<TambahKaryawanPage> createState() => _TambahKaryawanPageState();
}

class _TambahKaryawanPageState extends State<TambahKaryawanPage> {
  String? _valGender;
  String? _valStatus;
  List _gender = ['Pria', 'Wanita'];
  List _status = ['Lajang', 'Menikah'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tambah Karyawan',
          style: appbarTextStyle,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: 12, right: 12),
          child: Column(
            children: [
              SizedBox(
                height: 24,
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Nama',
                  contentPadding: EdgeInsets.all(12),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Jabatan',
                  contentPadding: EdgeInsets.all(12),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              TextFormField(
                decoration: InputDecoration(
                    hintText: 'NIK',
                    contentPadding: EdgeInsets.all(12),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15))),
              ),
              SizedBox(
                height: 12,
              ),
              DropdownButtonFormField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(12),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                ),
                hint: Text("Jenis kelamin"),
                value: _valGender,
                items: _gender.map((value) {
                  return DropdownMenuItem(
                    child: Text(value),
                    value: value,
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _valGender = value.toString();
                  });
                },
              ),
              SizedBox(
                height: 12,
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Tanggal lahir',
                  contentPadding: EdgeInsets.all(12),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Nomor telepon',
                  contentPadding: EdgeInsets.all(12),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              DropdownButtonFormField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(12),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                ),
                hint: Text("Status"),
                value: _valStatus,
                items: _status.map((value) {
                  return DropdownMenuItem(
                    child: Text(value),
                    value: value,
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _valStatus = value.toString();
                  });
                },
              ),
              SizedBox(
                height: 12,
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Tahun bergabung',
                  contentPadding: EdgeInsets.all(12),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              SizedBox(
                height: 34,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 128,
                    height: 48,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xff849974),
                    ),
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'Submit',
                        style: editBtnTextStyle,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
