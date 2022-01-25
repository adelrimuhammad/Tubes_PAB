import 'package:flutter/material.dart';
import 'package:penkar/models/karyawan_model.dart';
import 'package:penkar/provider/karyawan_provider.dart';
import 'package:penkar/themes.dart';
import 'package:provider/provider.dart';

class TambahKaryawanPage extends StatefulWidget {
  @override
  State<TambahKaryawanPage> createState() => _TambahKaryawanPageState();
}

class _TambahKaryawanPageState extends State<TambahKaryawanPage> {
  String? _valGender;
  String? _valStatus;
  List _gender = ['Pria', 'Wanita'];
  List _status = ['Lajang', 'Menikah'];

  bool isUploaded = false;
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
  Widget build(BuildContext context) {
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

    var karyawanProvider = Provider.of<KaryawanProvider>(context);

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
                controller: nameController,
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
                controller: jabatanController,
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
                controller: nikController,
                decoration: InputDecoration(
                    hintText: 'NIK',
                    contentPadding: EdgeInsets.all(12),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15))),
              ),
              SizedBox(
                height: 12,
              ),
              SizedBox(
                height: 12,
              ),
              TextFormField(
                controller: tgl_lahirController,
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
                controller: no_telpController,
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
              TextFormField(
                controller: statusController,
                decoration: InputDecoration(
                  hintText: 'Status',
                  contentPadding: EdgeInsets.all(12),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              TextFormField(
                controller: tahun_bergabungController,
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
                              await KaryawanProvider.tambah(
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
                            showSuccess('karyawan sudah terdaftar');
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
