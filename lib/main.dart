import 'package:flutter/material.dart';
import 'package:penkar/pages/detail_karyawan_page.dart';
import 'package:penkar/pages/list_data_page.dart';
import 'package:penkar/pages/tambah_karyawan_page.dart';
import 'package:penkar/pages/update_karyawan_page.dart';
import 'package:penkar/pages/login_page.dart';
import 'package:penkar/provider/karyawan_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<KaryawanProvider>(
          create: (context) => KaryawanProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Penkar',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.indigo,
          accentColor: Color(0xff849974),
        ),
        home: LoginPage(),
        routes: {
          '/home': (context) => ListDataPage(),
          '/tambah': (context) => TambahKaryawanPage(),
        },
      ),
    );
  }
}
