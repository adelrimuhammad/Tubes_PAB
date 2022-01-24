import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:penkar/models/karyawan_model.dart';
import 'package:penkar/themes.dart';

class CardKaryawan extends StatelessWidget {
  final KaryawanModel karyawan;
  const CardKaryawan(this.karyawan);

  @override
  Widget build(BuildContext context) {
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
                  karyawan.name.toString(),
                  style: tableCardTextStyle,
                ),
                SizedBox(
                  width: 50,
                ),
                Text(
                  karyawan.jabatan.toString(),
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
  }
}
