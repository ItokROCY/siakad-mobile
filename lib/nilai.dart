import 'package:flutter/material.dart';
import 'package:csv/csv.dart';
import 'package:flutter/services.dart' show rootBundle;

class NilaiPage extends StatefulWidget {
  @override
  _NilaiPageState createState() => _NilaiPageState();
}

class _NilaiPageState extends State<NilaiPage> {
  List<List<dynamic>> _nilaiData = [];

  @override
  void initState() {
    super.initState();
    _loadNilaiData();
  }

  Future<void> _loadNilaiData() async {
    try {
      String csvData = await rootBundle.loadString('assets/csv/nilaicsv.csv');
      _nilaiData = CsvToListConverter().convert(csvData);
    } catch (e) {
      print("Error: $e");
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nilai Mata Kuliah'),
      ),
      body: _nilaiData.isEmpty
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: _nilaiData.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title:
                      Text('Kode: ${_nilaiData[index][1]}'), // Kode Mata Kuliah
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          'Mata Kuliah: ${_nilaiData[index][2]}'), // Nama Mata Kuliah
                      Text('Semester: ${_nilaiData[index][3]}'), // Semester
                      Text(
                          'Nilai Huruf: ${_nilaiData[index][4]}'), // Nilai Angka
                      Text(
                          'Nilai Angka: ${_nilaiData[index][5]}'), // Nilai Huruf
                    ],
                  ),
                );
              },
            ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1, // Index halaman saat ini (sesuaikan jika diperlukan)
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Nilai',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
        onTap: (index) {
          // Tambahkan logika navigasi antar halaman jika diperlukan
          // Contoh:
          if (index == 0) {
            Navigator.pushNamed(context, '/beranda');
          } else if (index == 2) {
            Navigator.pushNamed(context, '/profil');
          }
        },
      ),
    );
  }
}
