// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:siakad/beranda.dart';
import 'package:siakad/login.dart';
import 'package:siakad/nilai.dart';
import 'package:siakad/profil.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ujian PAB',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(), // Halaman login
        '/beranda': (context) => BerandaPage(), // Halaman beranda
        '/nilai': (context) => NilaiPage(), // Halaman nilai
        '/profil': (context) => ProfilPage() // Halaman profil
      },
    );
  }
}
