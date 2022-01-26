import 'package:flutter/material.dart';
import 'package:penkar/models/karyawan_model.dart';
import 'package:penkar/pages/update_karyawan_page.dart';
import 'package:penkar/provider/karyawan_provider.dart';
import 'package:penkar/themes.dart';
import 'package:provider/provider.dart';

class UpdateKaryawanPage extends StatefulWidget {
  late final KaryawanModel karyawan;
  UpdateKaryawanPage(this.karyawan);

  @override
  State<UpdateKaryawanPage> createState() => _UpdateKaryawanPageState();
}

class _UpdateKaryawanPageState extends State<UpdateKaryawanPage> {
  TextEditingController nameController = TextEditingController(text: '');
  TextEditingController jabatanController = TextEditingController(text: '');
  TextEditingController nikController = TextEditingController(text: '');
  TextEditingController tgl_lahirController = TextEditingController(text: '');
  TextEditingController no_telpController = TextEditingController(text: '');
  TextEditingController statusController = TextEditingController(text: '');
  TextEditingController tahun_bergabungController =
      TextEditingController(text: '');
  bool isLoading = false;
  @override
  void showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.red,
        content: Text(message),
      ),
    );
  }

  void showSuccess(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.green,
        content: Text(message),
      ),
    );
  }

  Widget build(BuildContext context) {
    var karyawanProvider = Provider.of<KaryawanProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Update Karyawan',
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
                enabled: true,
                controller: nameController,
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
                enabled: true,
                controller: jabatanController,
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
                enabled: true,
                controller: nikController,
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
                enabled: true,
                controller: tgl_lahirController,
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
                enabled: true,
                controller: no_telpController,
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
                enabled: true,
                controller: statusController,
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
                enabled: true,
                controller: tahun_bergabungController,
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
                      color: Color(0xff849974),
                    ),
                    child: TextButton(
                      onPressed: () async {
                        if (nameController.text.isEmpty ||
                            jabatanController.text.isEmpty ||
                            nikController.text.isEmpty ||
                            tgl_lahirController.text.isEmpty ||
                            no_telpController.text.isEmpty ||
                            statusController.text.isEmpty ||
                            tahun_bergabungController.text.isEmpty) {
                          showError('semua field harus diisi');
                        } else {
                          setState(() {
                            isLoading = true;
                          });
                          KaryawanModel? karyawan =
                              await KaryawanProvider.update(
                                  widget.karyawan.id.toString(),
                                  nameController.text,
                                  jabatanController.text,
                                  nikController.text,
                                  tgl_lahirController.text,
                                  no_telpController.text,
                                  statusController.text,
                                  tahun_bergabungController.text);

                          setState(() {
                            isLoading = false;
                          });

                          if (karyawan == null) {
                            showSuccess('karyawan sudah terupdate');
                            Navigator.pushNamedAndRemoveUntil(
                                context, '/home', (route) => false);
                          } else {
                            karyawanProvider.karyawan = karyawan;
                            Navigator.pushNamedAndRemoveUntil(
                                context, '/home', (route) => false);
                          }
                        }
                      },
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
