import 'package:flutter/material.dart';
import 'package:penkar/themes.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff36384C),
      body: SafeArea(
        child: Center(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 18),
            child: Column(
              children: [
                SizedBox(
                  height: 48,
                ),
                Text(
                  'Penkar',
                  style: penkarLogoTextStyle,
                ),
                Text(
                  'ADMIN',
                  style: subTitleTextStyle,
                ),
                SizedBox(
                  height: 48,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(12),
                    hintText: 'Username',
                    fillColor: Color(0xffF1F0F5),
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                      borderSide: BorderSide(color: Color(0xff849974)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(12),
                    hintText: 'Password',
                    fillColor: Color(0xffF1F0F5),
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                      borderSide: BorderSide(color: Color(0xff849974)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                TextButton(
                  onPressed: () {},
                  child: Text('Lupa password?'),
                ),
                SizedBox(
                  height: 12,
                ),
                Container(
                  width: 450,
                  height: 50,
                  child: TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: Color(0xff849974),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(66))),
                      onPressed: () {
                        Navigator.pushNamed(context, '/home');
                      },
                      child: Text(
                        'Login',
                        style: editBtnTextStyle,
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
