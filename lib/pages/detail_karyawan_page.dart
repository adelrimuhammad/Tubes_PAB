import 'package:flutter/material.dart';
import 'package:penkar/models/karyawan_model.dart';
import 'package:penkar/pages/update_karyawan_page.dart';
import 'package:penkar/provider/karyawan_provider.dart';
import 'package:penkar/themes.dart';
import 'package:provider/provider.dart';

class DetailKaryawanPage extends StatefulWidget {
  late final KaryawanModel karyawan;
  DetailKaryawanPage(this.karyawan);

  @override
  State<DetailKaryawanPage> createState() => _DetailKaryawanPageState();
}

class _DetailKaryawanPageState extends State<DetailKaryawanPage> {
  @override
  Widget build(BuildContext context) {
    var karyawanProvider = Provider.of<KaryawanProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detail Karyawan',
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
              TextField(
                enabled: false,
                decoration: InputDecoration(
                  hintText: widget.karyawan.name,
                  contentPadding: EdgeInsets.all(12),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              TextField(
                enabled: false,
                decoration: InputDecoration(
                  hintText: widget.karyawan.jabatan,
                  contentPadding: EdgeInsets.all(12),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              TextField(
                enabled: false,
                decoration: InputDecoration(
                  hintText: widget.karyawan.nik,
                  contentPadding: EdgeInsets.all(12),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              TextField(
                enabled: false,
                decoration: InputDecoration(
                  hintText: widget.karyawan.tgl_lahir,
                  contentPadding: EdgeInsets.all(12),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              TextField(
                enabled: false,
                decoration: InputDecoration(
                  hintText: widget.karyawan.no_tlp,
                  contentPadding: EdgeInsets.all(12),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              TextField(
                enabled: false,
                decoration: InputDecoration(
                  hintText: widget.karyawan.status,
                  contentPadding: EdgeInsets.all(12),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              TextField(
                enabled: false,
                decoration: InputDecoration(
                  hintText: widget.karyawan.tahun_bergabung.toString(),
                  contentPadding: EdgeInsets.all(12),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 128,
                    height: 48,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.red, width: 2),
                    ),
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'Hapus',
                        style: deleteBtnTextStyle,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 24,
                  ),
                  Container(
                    width: 128,
                    height: 48,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xff849974),
                    ),
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    UpdateKaryawanPage(widget.karyawan)));
                      },
                      child: Text(
                        'Edit',
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
