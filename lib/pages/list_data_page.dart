import 'package:flutter/material.dart';
import 'package:penkar/card_karyawan.dart';
import 'package:penkar/models/karyawan_model.dart';
import 'package:penkar/provider/karyawan_provider.dart';
import 'package:penkar/themes.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class ListDataPage extends StatelessWidget {
  const ListDataPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var karyawanProvider = Provider.of<KaryawanProvider>(context);
    return Sizer(builder: (context, orientation, deviceType) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            'List Data Karyawan',
            style: appbarTextStyle,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/tambah');
          },
          child: Icon(Icons.add),
        ),
        body: Builder(builder: (context) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              children: [
                SizedBox(
                  height: 34,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xffE4E3E3),
                  ),
                  height: 35,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Nama',
                        style: tableTitleTextStyle,
                      ),
                      Text(
                        'Jabatan',
                        style: tableTitleTextStyle,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                //
                //Card pegawai
                Container(
                  height: 65.h,
                  child: FutureBuilder<List<KaryawanModel>>(
                      future: karyawanProvider.getKaryawans(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          return ListView(
                            children: [
                              Column(
                                children: snapshot.data!
                                    .map((karyawan) => CardKaryawan(karyawan))
                                    .toList(),
                              )
                            ],
                          );
                        }
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }),
                )
              ],
            ),
          );
        }),
      );
    });
  }
}
