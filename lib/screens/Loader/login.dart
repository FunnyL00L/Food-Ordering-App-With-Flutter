// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:food_ordering_app_with_flutter_and_bloc/screens/home/home_screen.dart';
import 'package:food_ordering_app_with_flutter_and_bloc/screens/admin/admininput/tambah.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    const inputBorder = BorderRadius.vertical(
      bottom: Radius.circular(10.0),
      top: Radius.circular(20.0),
    );

    return FlutterLogin(
      title: 'Caffe Dunia',
      onLogin: (loginData) {
        if (loginData.name == '' && loginData.password == '') {
          // Jika login berhasil, navigasikan ke halaman HomeScreen
          return Future.delayed(Duration(milliseconds: 500)).then((_) {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => ProductListScreen(),
            ));
          });
        } else {
          // Jika login gagal, tampilkan pesan error
          return Future.delayed(Duration(milliseconds: 500)).then((_) {
            return 'Login gagal. Pastikan Anda menggunakan akun admin yang benar.';
          });
        }
      },
      onSignup: (_) => Future(() => null),
      onSubmitAnimationCompleted: () {},
      onRecoverPassword: (_) => Future(() => null),
      theme: LoginTheme(
        primaryColor: Colors.teal,
        accentColor: Colors.yellow,
        errorColor: Colors.deepOrange,
        titleStyle: const TextStyle(
          color: Colors.greenAccent,
          fontFamily: 'Quicksand',
          letterSpacing: 4,
        ),
        bodyStyle: const TextStyle(
          fontStyle: FontStyle.italic,
          decoration: TextDecoration.underline,
        ),
        textFieldStyle: const TextStyle(
          color: Colors.orange,
          shadows: [Shadow(color: Colors.yellow, blurRadius: 2)],
        ),
        buttonStyle: const TextStyle(
          fontWeight: FontWeight.w800,
          color: Colors.yellow,
        ),
        cardTheme: CardTheme(
          color: Colors.yellow.shade100,
          elevation: 5,
          margin: const EdgeInsets.only(top: 15),
          shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.circular(100.0),
          ),
        ),
        inputTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.purple.withOpacity(.1),
          contentPadding: EdgeInsets.zero,
          errorStyle: const TextStyle(
            backgroundColor: Colors.orange,
            color: Colors.white,
          ),
          labelStyle: const TextStyle(fontSize: 12),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.blue.shade700, width: 4),
            borderRadius: inputBorder,
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.blue.shade400, width: 5),
            borderRadius: inputBorder,
          ),
          errorBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.red.shade700, width: 7),
            borderRadius: inputBorder,
          ),
          focusedErrorBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.red.shade400, width: 8),
            borderRadius: inputBorder,
          ),
          disabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 5),
            borderRadius: inputBorder,
          ),
        ),
        buttonTheme: LoginButtonTheme(
          splashColor: Colors.purple,
          backgroundColor: Colors.pinkAccent,
          highlightColor: Colors.lightGreen,
          elevation: 9.0,
          highlightElevation: 6.0,
          shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
