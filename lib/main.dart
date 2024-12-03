import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'pages/tasbih_digital_page.dart';
import 'pages/doa_page.dart';
import 'pages/to_do_list_page.dart';

void main() {
  runApp(MeAndAllahApp());
}

class MeAndAllahApp extends StatefulWidget {
  @override
  _MeAndAllahAppState createState() => _MeAndAllahAppState();
}

class _MeAndAllahAppState extends State<MeAndAllahApp> {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    super.initState();
    _initializeNotifications();
  }

  // Fungsi untuk menginisialisasi notifikasi
  Future<void> _initializeNotifications() async {
    const AndroidInitializationSettings androidInitializationSettings =
        AndroidInitializationSettings('app_icon'); // Sesuaikan dengan icon aplikasi Anda

    final InitializationSettings initializationSettings = InitializationSettings(
      android: androidInitializationSettings,
    );

    // Initialize the notifications plugin
    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: _onSelectNotification, // Fungsi saat menekan notifikasi
    );
  }

  // Fungsi untuk menangani saat notifikasi ditekan
  Future<void> _onSelectNotification(NotificationResponse notificationResponse) async {
    if (notificationResponse.payload != null) {
      print('Notification payload: ${notificationResponse.payload}');
      // Anda bisa melakukan navigasi atau aksi lainnya sesuai kebutuhan
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Me and Allah',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MainPage(
        flutterLocalNotificationsPlugin: flutterLocalNotificationsPlugin,
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  MainPage({required this.flutterLocalNotificationsPlugin});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  // List halaman untuk navigasi
  final List<Widget> _pages = [
    TasbihDigitalPage(),
    ToDoListPage(),
    DoaPage(),
  ];

  // Fungsi untuk menangani perubahan halaman yang dipilih
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            // Profil di kiri AppBar
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white, // Warna lingkaran putih
              ),
              padding: EdgeInsets.all(5), // Jarak antara lingkaran putih dan avatar
              child: CircleAvatar(
                radius: 20,
                backgroundColor: Colors.green[700],
                child: Icon(
                  FontAwesomeIcons.user,
                  color: Colors.white,
                  size: 16,
                ),
              ),
            ),
            SizedBox(width: 10),
            // Nama dan Kata di sebelah kanan avatar
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Alhubul', // Nama profile
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 3),
                Text(
                  'Semoga Amal Ibadah Kita Diterima Oleh Allah', // Deskripsi
                  style: TextStyle(
                    fontSize: 12,
                    fontStyle: FontStyle.italic,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ],
        ),
        backgroundColor: Colors.green[700],
      ),
      body: _pages[_selectedIndex], // Menampilkan halaman sesuai pilihan
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.green[700],
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        items: const [
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.prayingHands),
            label: 'Tasbih',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.checkCircle),
            label: 'To-Do',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.book),
            label: 'Doa',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
