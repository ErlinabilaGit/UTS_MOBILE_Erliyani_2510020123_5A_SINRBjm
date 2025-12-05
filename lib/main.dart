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

      theme: ThemeData(
        primaryColor: const Color(0xFFFFE082),
        scaffoldBackgroundColor: const Color(0xFFFFFDE7),

        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFFFE082),
          foregroundColor: Colors.black,
          elevation: 2,
        ),

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFFFD54F),
            foregroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),

        inputDecorationTheme: const InputDecorationTheme(
          filled: true,
          fillColor: Color(0xFFFFF9C4),
          border: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFFFD54F)),
          ),
        ),

        chipTheme: const ChipThemeData(
          backgroundColor: Color(0xFFFFECB3),
          labelStyle: TextStyle(color: Colors.black, fontSize: 10),
          padding: EdgeInsets.symmetric(horizontal: 8),
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
        'https://jambiindependent.bacakoran.co/upload/b7b800f70d49b44195cdce801a044d18.jpeg',
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
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();

  void login() {
    if (username.text.isEmpty || password.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Username & Password wajib diisi')),
      );
      return;
    }

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
      backgroundColor: Colors.white,

      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Column(
            children: [
              Container(
                width: 130,
                height: 130,
                decoration: const BoxDecoration(
                  color: Color(0xFFFFF3CD),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.restaurant,
                  size: 60,
                  color: Color(0xFFFFB300),
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                'Makanan Kalimantan Selatan',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 6),
              const Text(
                'Masuk untuk mulai menjelajah',
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),

              const SizedBox(height: 30),

              TextField(
                controller: username,
                decoration: const InputDecoration(
                  labelText: 'Username',
                  prefixIcon: Icon(Icons.person),
                ),
              ),

              const SizedBox(height: 18),

              TextField(
                controller: password,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.lock),
                ),
              ),

              const SizedBox(height: 25),

              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: login,
                  child: const Text(
                    'SIGN IN',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// ================= HALAMAN LIST MAKANAN =================
class ListMakananPage extends StatefulWidget {
  final String username;
  const ListMakananPage({super.key, required this.username});

  @override
  State<ListMakananPage> createState() => _ListMakananPageState();
}

class _ListMakananPageState extends State<ListMakananPage> {
  String search = '';

  @override
  Widget build(BuildContext context) {
    final filtered = daftarMakanan
        .where((m) => m.nama.toLowerCase().contains(search.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Daftar Makanan')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              onChanged: (value) => setState(() => search = value),
              decoration: const InputDecoration(
                hintText: 'Cari makanan...',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: filtered.length,
              itemBuilder: (context, index) {
                final makanan = filtered[index];
                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  child: ListTile(
                    isThreeLine: true,
                    leading: Image.network(
                      makanan.imageUrl,
                      width: 60,
                      fit: BoxFit.cover,
                    ),
                    title: Text(makanan.nama),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(makanan.asal),
                        const SizedBox(height: 4),
                        Wrap(
                          spacing: 6,
                          children: makanan.kategori
                              .map(
                                (k) => Chip(
                                  label: Text(
                                    k,
                                    style: const TextStyle(fontSize: 10),
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ],
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DetailMakananPage(makanan: makanan),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
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
          children: [
            Image.network(makanan.imageUrl),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                makanan.deskripsiLengkap,
                textAlign: TextAlign.justify,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
