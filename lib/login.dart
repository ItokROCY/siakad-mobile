import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final String validNIM = '1462100197';
  final String validPassword = '1462100188';
  TextEditingController _nimController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  void _login(BuildContext context, String nim, String password) {
    if (nim == validNIM && password == validPassword) {
// Login berhasil, ke halaman beranda atau halaman selanjutnya
      Navigator.pushReplacementNamed(context, '/beranda');
    } else {
// Login gagal, tampilkan pesan kesalahan
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('NIM atau password salah, silahkan coba lagi'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Image.asset(
              'assets/img/foto-3.png',
              height: 180, // Ubah tinggi gambar sesuai keinginan
              width: 180, // Ubah lebar gambar sesuai keinginan
            ),
            SizedBox(height: 24.0),
            TextField(
              controller: _nimController,
              decoration: InputDecoration(
                labelText: 'NIM',
              ),
            ),
            SizedBox(height: 12.0),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () {
                _login(context, _nimController.text, _passwordController.text);
              },
              child: Text('Login'),
            ),
            SizedBox(height: 24.0),
            Text(
              'Program Studi Teknik Informatika',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            Text(
              'UNTAG Surabaya',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.grey,
              ),
            ),
            Text(
              'Bessotu Putra Herani - 1462100197',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
