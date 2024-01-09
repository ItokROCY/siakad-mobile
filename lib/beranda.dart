import 'package:flutter/material.dart';
import 'package:csv/csv.dart';
import 'package:flutter/services.dart' show rootBundle;

class BerandaPage extends StatefulWidget {
  @override
  _BerandaPageState createState() => _BerandaPageState();
}

class _BerandaPageState extends State<BerandaPage> {
  List<List<dynamic>> _courseData = [];

  @override
  void initState() {
    super.initState();
    _loadCourseData();
  }

  Future<void> _loadCourseData() async {
    try {
      String csvData = await rootBundle.loadString('assets/csv/beranda.csv');
      _courseData = CsvToListConverter().convert(csvData);
    } catch (e) {
      print("Error: $e");
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[700],
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Image.asset(
                'assets/img/foto-3.png', // Ubah dengan path logo UNTAG
                height: 40, // Sesuaikan dengan tinggi logo yang diinginkan
                width: 40, // Sesuaikan dengan lebar logo yang diinginkan
              ),
            ),
            SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Program Studi Teknik Informatika',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text(
                  'UNTAG Surabaya',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            color: Colors.orange[300],
            padding: EdgeInsets.all(16),
            child: Text(
              'Jadwal Kuliah',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: _courseData.isEmpty
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    itemCount: _courseData.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${_courseData[index][1]}', // Kode Mata Kuliah
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '${_courseData[index][2]}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ), // Nama Mata Kuliah
                            ),
                          ],
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Kelas: ${_courseData[index][3]}'), // Kelas
                            Text('Hari: ${_courseData[index][4]}'), // Hari
                            Text(
                                'Jam: ${_courseData[index][5]} - ${_courseData[index][6]}'), // Jam Mulai - Jam Selesai
                            Text(
                                'Ruangan: ${_courseData[index][7]}'), // Ruangan
                          ],
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0, // Index halaman saat ini (sesuaikan jika diperlukan)
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
          if (index == 1) {
            Navigator.pushNamed(context, '/nilai');
          } else if (index == 2) {
            Navigator.pushNamed(context, '/profil');
          }
        },
      ),
    );
  }
}
