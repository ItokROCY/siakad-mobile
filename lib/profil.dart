import 'package:flutter/material.dart';
import 'package:csv/csv.dart';
import 'package:flutter/services.dart' show rootBundle;

class ProfilPage extends StatefulWidget {
  @override
  _ProfilPageState createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  List<dynamic> _profilData = [];

  @override
  void initState() {
    super.initState();
    _loadProfilData();
  }

  Future<void> _loadProfilData() async {
    try {
      String csvData = await rootBundle.loadString('assets/csv/profil.csv');
      List<List<dynamic>> csvTable = CsvToListConverter().convert(csvData);
      if (csvTable.isNotEmpty) {
        _profilData = csvTable.first;
      }
    } catch (e) {
      print("Error: $e");
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil'),
      ),
      body: _profilData.isEmpty
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/img/profil.png'),
                      radius: 50.0,
                    ),
                  ),
                  SizedBox(height: 16.0), // Berikan sedikit spasi
                  ListTile(
                    title: Text('NIM: ${_profilData[0]}'), // NIM
                  ),
                  ListTile(
                    title: Text('Nama: ${_profilData[1]}'), // Nama
                  ),
                  ListTile(
                    title: Text(
                        'Tempat/Tanggal Lahir: ${_profilData[2]}'), // Tempat/Tanggal Lahir
                  ),
                  ListTile(
                    title: Text('IPK: ${_profilData[3]}'), // IPK
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/');
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.red),
                      ),
                      child: Text(
                        'Logout',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              ),
            ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2, // Index halaman saat ini (sesuaikan jika diperlukan)
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
          } else if (index == 1) {
            Navigator.pushNamed(context, '/nilai');
          }
        },
      ),
    );
  }
}
