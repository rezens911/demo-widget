import 'package:flutter/material.dart';

import '../widgets/input_field.dart';
import '../widgets/tombol_utama.dart';
import 'login_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int angka = 0;
  String nama = 'Muhamad Rizki Maulana';

  // Menambah angka
  void tambahAngka() {
    setState(() {
      angka++;
    });
  }

  // Mengurangi angka
  void kurangiAngka() {
    setState(() {
      angka--;
    });
  }

  // Mengubah nama (bagian "Ganti Nama": memakai InputField dan TombolUtama)
  Future<void> ubahNama() async {
    final controller = TextEditingController(text: nama);

    try {
      final String? hasil = await showDialog<String>(
        context: context,
        builder: (dialogContext) {
          return AlertDialog(
            title: const Text('Ubah Nama'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                InputField(
                  controller: controller,
                  hint: 'Masukkan nama baru',
                  icon: Icons.person,
                ),
                const SizedBox(height: 16),
                TombolUtama(
                  label: 'Simpan',
                  onPressed: () {
                    Navigator.of(dialogContext).pop(controller.text.trim());
                  },
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(dialogContext).pop();
                },
                child: const Text('Batal'),
              ),
            ],
          );
        },
      );

      if (!mounted || hasil == null) return;

      if (hasil.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Nama tidak boleh kosong!')),
        );
        return;
      }

      setState(() {
        nama = hasil;
      });

      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Nama berhasil diubah!')));
    } finally {
      controller.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFAFF),

      // AppBar halaman utama
      appBar: AppBar(
        title: Text(
          widget.title,
          style: const TextStyle(fontSize: 18, color: Colors.black87),
        ),
        backgroundColor: const Color(0xFFD1BDF8),
        elevation: 0,
      ),

      // Isi halaman utama
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Nama pengguna
              Text(
                'Nama: $nama',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),

              const SizedBox(height: 10),

              // Tombol ubah nama
              OutlinedButton(
                onPressed: ubahNama,
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.deepPurple,
                  side: const BorderSide(color: Color(0xFFE6DDEB)),
                  shape: const StadiumBorder(),
                ),
                child: const Text('Ubah Nama'),
              ),

              const SizedBox(height: 24),

              // Keterangan penghitung
              const Text(
                'You have pushed the button this many times:',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12, color: Colors.black87),
              ),

              const SizedBox(height: 2),

              // Angka penghitung
              Text(
                '$angka',
                style: const TextStyle(fontSize: 24, color: Colors.black87),
              ),

              const SizedBox(height: 6),

              // Tombol Increment
              SizedBox(
                width: 110,
                height: 32,
                child: OutlinedButton(
                  onPressed: tambahAngka,
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.deepPurple,
                    backgroundColor: const Color(0xFFF8F4FC),
                    side: const BorderSide(color: Color(0xFFE6DDEB)),
                    padding: EdgeInsets.zero,
                    shape: const StadiumBorder(),
                  ),
                  child: const Text(
                    'Increment',
                    style: TextStyle(fontSize: 12),
                  ),
                ),
              ),

              const SizedBox(height: 5),

              // Tombol Decrement
              SizedBox(
                width: 110,
                height: 32,
                child: OutlinedButton(
                  onPressed: kurangiAngka,
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.deepPurple,
                    backgroundColor: const Color(0xFFF8F4FC),
                    side: const BorderSide(color: Color(0xFFE6DDEB)),
                    padding: EdgeInsets.zero,
                    shape: const StadiumBorder(),
                  ),
                  child: const Text(
                    'Decrement',
                    style: TextStyle(fontSize: 12),
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // Navigasi ke halaman login
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (context) => const LoginPage(),
                    ),
                  );
                },
                icon: const Icon(Icons.arrow_forward),
                label: const Text('Buka Halaman Kedua'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 12,
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
