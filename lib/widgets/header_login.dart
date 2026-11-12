import 'package:flutter/material.dart';

/// Judul dan ikon di bagian atas halaman login.
class HeaderLogin extends StatelessWidget {
  const HeaderLogin({super.key, required this.judul});

  final String judul;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Icon(Icons.lock_outline, size: 64, color: Colors.blue),
        const SizedBox(height: 12),
        Text(
          judul,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
