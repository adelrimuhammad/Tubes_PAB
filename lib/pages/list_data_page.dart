import 'package:flutter/material.dart';
import 'package:penkar/themes.dart';
import 'package:sizer/sizer.dart';

class ListDataPage extends StatelessWidget {
  const ListDataPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        body: Container(
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
                child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, '/detail');
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 8),
                              padding: EdgeInsets.only(left: 16, right: 16),
                              decoration: BoxDecoration(
                                //color: Color(0xffE9DCCD),
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(),
                              ),
                              height: 35,
                              child: Row(
                                children: [
                                  Text(
                                    'Nama',
                                    style: tableCardTextStyle,
                                  ),
                                  SizedBox(
                                    width: 50,
                                  ),
                                  Text(
                                    'Jabatan',
                                    style: tableCardTextStyle,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                        ],
                      );
                    }),
              )
            ],
          ),
        ),
      );
    });
  }
}
