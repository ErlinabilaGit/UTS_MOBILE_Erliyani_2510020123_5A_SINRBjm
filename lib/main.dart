import 'package:flutter/material.dart';

void main() {
  runApp(const MakananKalselApp());
}

/// ================= APLIKASI UTAMA =================
class MakananKalselApp extends StatelessWidget {
  const MakananKalselApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Makanan Tradisional Kalsel',
      debugShowCheckedModeBanner: false,

      // ===== TEMA KUNING PUTIH LEMBUT =====
      theme: ThemeData(
        primaryColor: const Color(0xFFFFD54F),
        scaffoldBackgroundColor: const Color(0xFFFFFBF2),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFFFD54F),
          foregroundColor: Colors.black87,
          elevation: 1,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFFFC107),
            foregroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          filled: true,
          fillColor: Color(0xFFFFF3E0),
          border: OutlineInputBorder(),
        ),
        chipTheme: const ChipThemeData(
          backgroundColor: Color(0xFFFFECB3),
          labelStyle: TextStyle(color: Colors.black87, fontSize: 12),
        ),
      ),

      home: const LoginPage(),
    );
  }
}

/// ================= MODEL DATA =================
class Makanan {
  final String nama;
  final String asal;
  final String deskripsiPendek;
  final String deskripsiLengkap;
  final String imageUrl;
  final List<String> kategori;

  Makanan({
    required this.nama,
    required this.asal,
    required this.deskripsiPendek,
    required this.deskripsiLengkap,
    required this.imageUrl,
    required this.kategori,
  });
}

/// ================= DATA MAKANAN =================
final List<Makanan> daftarMakanan = [
  Makanan(
    nama: 'Soto Banjar',
    asal: 'Banjarmasin',
    deskripsiPendek: 'Soto ayam khas Banjar dengan kuah bening.',
    deskripsiLengkap:
        'Soto Banjar merupakan salah satu makanan khas paling terkenal dari Kalimantan Selatan. '
        'Soto ini memiliki ciri khas kuah bening yang kaya rempah seperti kayu manis, cengkeh, '
        'dan pala. Isiannya berupa suwiran ayam kampung, telur rebus, perkedel, serta lontong. '
        'Soto Banjar biasanya disajikan dengan sambal, jeruk nipis, dan nasi atau ketupat. '
        'Makanan ini sering dijumpai pada acara keluarga, hajatan, dan kegiatan adat.',
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSFkxd5U2Qo77QuY3VSCvBvE0j7XgNWlh-USA&s',
    kategori: ['Berkuah', 'Ayam'],
  ),
  Makanan(
    nama: 'Ketupat Kandangan',
    asal: 'Hulu Sungai Selatan',
    deskripsiPendek: 'Ketupat dengan ikan gabus bersantan.',
    deskripsiLengkap:
        'Ketupat Kandangan adalah makanan khas daerah Kandangan, Hulu Sungai Selatan, '
        'yang sangat terkenal dengan cita rasa gurih dan lezat. Ketupat ini disajikan '
        'dengan potongan ikan gabus yang dimasak dengan kuah santan kental berwarna kuning. '
        'Bumbu khas rempah Banjar membuat rasa kuahnya semakin nikmat. Makanan ini biasa '
        'dijadikan menu sarapan atau hidangan pada acara keluarga dan hari besar.',
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRuSnm32jylJ5vk7jDXfw-WZKZU-SGV85AgfQ&s',
    kategori: ['Santan', 'Ikan'],
  ),
  Makanan(
    nama: 'Lontong Orari',
    asal: 'Banjarmasin',
    deskripsiPendek: 'Lontong khas dengan kuah merah pedas.',
    deskripsiLengkap:
        'Lontong Orari merupakan makanan khas Banjarmasin yang biasanya dijual pada pagi hari '
        'sebagai menu sarapan. Lontong ini disajikan dengan kuah merah berbumbu khas yang terasa '
        'pedas dan gurih. Isiannya terdiri dari irisan lontong, telur, ayam, dan sambal khas. '
        'Nama Lontong Orari berasal dari lokasi penjual pertamanya yang berada di dekat Kantor Orari.',
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSkscxL4jUEV8ombPM8gaGXwzLGcyVqbrNBpQ&s',
    kategori: ['Pedas', 'Sarapan'],
  ),
  Makanan(
    nama: 'Gangan Asam',
    asal: 'Kalimantan Selatan',
    deskripsiPendek: 'Sayur asam khas Banjar dengan ikan.',
    deskripsiLengkap:
        'Gangan Asam adalah masakan berkuah asam khas masyarakat Banjar yang sangat menyegarkan. '
        'Masakan ini biasanya dibuat dari ikan laut atau ikan sungai yang dimasak dengan bumbu asam, '
        'kunyit, bawang, dan rempah lainnya. Rasa asam segar berpadu dengan gurihnya ikan membuat '
        'hidangan ini sangat cocok disantap bersama nasi panas. Gangan Asam sering menjadi menu '
        'harian di rumah-rumah masyarakat Kalimantan Selatan.',
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTMbz2vQfuK7cw3KJ7Y0-o0flDi0Fp2cbrDLA&s',
    kategori: ['Asam', 'Ikan'],
  ),
];

/// ================= HALAMAN LOGIN =================
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final username = TextEditingController();
  final password = TextEditingController();

  void login() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => ListMakananPage(username: username.text),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ===== IKON HITAM DALAM LINGKARAN KUNING =====
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFFFFC107), // latar kuning
                shape: BoxShape.circle,
              ),
              padding: const EdgeInsets.all(20),
              child: const Icon(
                Icons.restaurant,
                size: 60,
                color: Colors.black, // ikon hitam
              ),
            ),
            const SizedBox(height: 16),

            // ===== JUDUL BESAR =====
            const Text(
              'Kuliner Khas Kalsel',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xFFFFC107),
              ),
            ),
            const SizedBox(height: 24),

            // ===== FORM LOGIN =====
            SizedBox(
              width: 300,
              child: TextField(
                controller: username,
                decoration: const InputDecoration(labelText: 'Username'),
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: 300,
              child: TextField(
                controller: password,
                obscureText: true,
                decoration: const InputDecoration(labelText: 'Password'),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 300,
              child: ElevatedButton(
                onPressed: login,
                child: const Text('SIGN IN'),
              ),
            ),

            const SizedBox(height: 24),

            // ===== SUBJUDUL =====
            const Text(
              'Aplikasi Makanan Tradisional Kalimantan Selatan',
              style: TextStyle(fontSize: 16, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

/// ================= HALAMAN DETAIL =================
class DetailMakananPage extends StatelessWidget {
  final Makanan makanan;
  const DetailMakananPage({super.key, required this.makanan});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(makanan.nama)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ===== GAMBAR FULL LEBAR RESPONSIF =====
            SizedBox(
              width: double.infinity,
              child: AspectRatio(
                aspectRatio: 16 / 9, // sesuaikan rasio, bisa 4/3 atau 16/9
                child: Image.network(
                  makanan.imageUrl,
                  fit: BoxFit.cover, // menjaga proporsi gambar
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ===== ASAL =====
                  Text(
                    "Asal: ${makanan.asal}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 12),

                  // ===== KATEGORI =====
                  const Text(
                    "Kategori:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 6),
                  Wrap(
                    spacing: 8,
                    children: makanan.kategori
                        .map((k) => Chip(label: Text(k)))
                        .toList(),
                  ),
                  const SizedBox(height: 16),

                  // ===== DESKRIPSI LENGKAP =====
                  Text(
                    makanan.deskripsiLengkap,
                    textAlign: TextAlign.justify,
                    style: const TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
