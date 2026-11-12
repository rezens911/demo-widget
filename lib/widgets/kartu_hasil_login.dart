import 'package:flutter/material.dart';

/// Kotak yang menampilkan username, password, dan pesan hasil login.
class KartuHasilLogin extends StatelessWidget {
  const KartuHasilLogin({
    super.key,
    required this.username,
    required this.password,
    required this.pesan,
    this.berhasil = false,
  });

  final String username;
  final String password;
  final String pesan;
  final bool berhasil;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Hasil Login',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text('Username: $username'),
            Text('Password: $password'),
            if (pesan.isNotEmpty) ...[
              const SizedBox(height: 8),
              Text(
                pesan,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: berhasil ? Colors.green : Colors.red,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
