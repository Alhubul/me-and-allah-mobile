import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; // Impor font_awesome_flutter

class DoaPage extends StatefulWidget {
  @override
  _DoaPageState createState() => _DoaPageState();
}

class _DoaPageState extends State<DoaPage> {
  String _doa = 'Memuat doa...';

  @override
  void initState() {
    super.initState();
    _fetchTimeAndDoa();
  }

  // Fungsi untuk mengambil waktu dari API publik dan menampilkan doa
  Future<void> _fetchTimeAndDoa() async {
  try {
    // Mengambil data waktu dari API publik (WorldTimeAPI)
    final response = await http.get(Uri.parse('http://worldtimeapi.org/api/timezone/Asia/Jakarta'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final String datetime = data['datetime']; // Ambil datetime
      print("Received datetime: $datetime");  // Debugging log untuk datetime

      // Mengambil waktu lokal dengan timezone offset
      DateTime currentTime = DateTime.parse(datetime);
      print("Parsed DateTime: $currentTime"); // Debugging log untuk waktu yang diambil

      final hour = currentTime.hour;  // Mendapatkan jam saat ini
      print("Current hour: $hour");  // Debugging log untuk jam yang diambil

      String doa = '';
      if (hour >= 5 && hour < 12) {
        doa = '''
Doa Setelah Sholat Subuh:
Dzikir (Tasbih, Tahmid, Takbir):
سُبْحَانَ اللَّهِ (Subhanallah) - 33 kali
الْحَمْدُ لِلَّهِ (Alhamdulillah) - 33 kali
اللَّهُ أَكْبَرُ (Allahu Akbar) - 34 kali

Doa:
اللَّهُمَّ إِنِّي أَسْأَلُكَ رَحْمَتَكَ وَمَغْفِرَتَكَ، وَالْعَافِيَةَ فِی دُنْيَا وَالْآخِرَةِ
(Allahumma inni as'aluka rahmataka wa maghfirataka, wal 'aafiyata fi dunya wal akhirah)
(Ya Allah, aku memohon kepada-Mu rahmat, ampunan, dan keselamatan di dunia dan akhirat.)
''';
      } else if (hour >= 12 && hour < 15) {
        doa = '''
Doa Setelah Sholat Dhuhur:
Dzikir (Tasbih, Tahmid, Takbir):
سُبْحَانَ اللَّهِ (Subhanallah) - 33 kali
الْحَمْدُ لِلَّهِ (Alhamdulillah) - 33 kali
اللَّهُ أَكْبَرُ (Allahu Akbar) - 34 kali

Doa:
اللَّهُمَّ اجْعَلْنِي مِنْ أَهْلِ الْجَنَّةِ وَمِنْ أَعْمَالٍ تَقَرِّبُني إِلَيْهَا
(Allahumma ajilni min ahlil jannati wa min a'maalin taqarribuni ilayha)
(Ya Allah, jadikanlah aku termasuk ahli surga dan amal-amal yang mendekatkan diriku kepada-Nya.)
''';
      } else if (hour >= 15 && hour < 18) {
        doa = '''
Doa Setelah Sholat Ashar:
Dzikir (Tasbih, Tahmid, Takbir):
سُبْحَانَ اللَّهِ (Subhanallah) - 33 kali
الْحَمْدُ لِلَّهِ (Alhamdulillah) - 33 kali
اللَّهُ أَكْبَرُ (Allahu Akbar) - 34 kali

Doa:
اللَّهُمَّ إِنِّي أَعُوذُ بِكَ مِنْ فِتْنَةِ الدُّنْيَا وَفِتْنَةِ الْمَحْيَا وَالْمَمَاتِ وَفِتْنَةِ الْمَسِيحِ الدَّجَّالِ
(Allahumma inni a'udhu bika min fitnati dunya wa fitnati al-mihya wal-mamat, wa fitnati al-masih al-dajjal)
(Ya Allah, aku berlindung kepada-Mu dari fitnah dunia, fitnah kehidupan dan kematian, serta fitnah Dajjal.)
''';
      } else if (hour >= 18 && hour < 19) {
        doa = '''
Doa Setelah Sholat Maghrib:
Dzikir (Tasbih, Tahmid, Takbir):
سُبْحَانَ اللَّهِ (Subhanallah) - 33 kali
الْحَمْدُ لِلَّهِ (Alhamdulillah) - 33 kali
اللَّهُ أَكْبَرُ (Allahu Akbar) - 34 kali

Doa:
اللَّهُمَّ اجْعَلْنَا مِنْ أَهْلِ الْمَغْفِرَةِ وَالْجَنَّةِ وَالْنُّورِ
(Allahumma ajilna min ahlil maghfirati wal jannati wal noor)
(Ya Allah, jadikanlah kami termasuk ahli ampunan, surga, dan cahaya-Mu.)
''';
      } else {
        doa = '''
Doa Setelah Sholat Isya:
Dzikir (Tasbih, Tahmid, Takbir):
سُبْحَانَ اللَّهِ (Subhanallah) - 33 kali
الْحَمْدُ لِلَّهِ (Alhamdulillah) - 33 kali
اللَّهُ أَكْبَرُ (Allahu Akbar) - 34 kali

Doa:
اللَّهُمَّ إِنِّي أَعُوذُ بِكَ مِنْ كُلِّ شَرٍّ، وَمِنْ عَذَابِ النَّارِ
(Allahumma inni a'udhu bika min kulli sharrin, wa min 'adhabi al-nar)
(Ya Allah, aku berlindung kepada-Mu dari segala keburukan dan dari azab neraka.)
''';
      }

      setState(() {
        _doa = doa;
      });
    } else {
      setState(() {
        _doa = 'Tidak dapat mengambil data waktu.';
      });
    }
  } catch (e) {
    setState(() {
      _doa = 'Terjadi kesalahan saat mengambil data.';
    });
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Doa Setelah Sholat'),
        backgroundColor: Colors.green[700],
        actions: [
          IconButton(
            icon: FaIcon(FontAwesomeIcons.book), // Ganti ikon di AppBar
            onPressed: () {
              // Aksi saat ikon diklik (jika diperlukan)
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.green[200]!, Colors.white],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Doa Setelah Sholat Fardu',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.green[800],
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 20),
                      Text(
                        _doa,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.green[800],
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Referensi: ',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.green[900],
                        ),
                      ),
                      Text(
                        '- Hadis riwayat Imam Muslim dalam Kitab Al-Adzkar.',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        '- Kitab Al-Adzkar oleh Imam An-Nawawi.',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        '- Kitab Riyadhus Shalihin oleh Imam An-Nawawi.',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
