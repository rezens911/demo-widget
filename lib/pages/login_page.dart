import 'package:flutter/material.dart';

import '../widgets/header_login.dart';
import '../widgets/input_field.dart';
import '../widgets/kartu_hasil_login.dart';
import '../widgets/tombol_utama.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Semua state dan controller hanya berada di sini.
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String _username = '';
  String _password = '';
  String _pesan = '';
  bool _berhasil = false;

  // Kredensial yang dianggap benar.
  static const String _usernameBenar = 'alex';
  static const String _passwordBenar = '123454321';

  void _login() {
    setState(() {
      _username = _usernameController.text;
      _password = _passwordController.text;

      if (_username == _usernameBenar && _password == _passwordBenar) {
        _berhasil = true;
        _pesan = 'Login Berhasil!';
      } else {
        _berhasil = false;
        _pesan = 'Username atau Password Salah!';
      }
    });
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const HeaderLogin(judul: 'Selamat Datang'),
            const SizedBox(height: 32),
            InputField(
              controller: _usernameController,
              hint: 'Username',
              icon: Icons.person,
            ),
            const SizedBox(height: 16),
            InputField(
              controller: _passwordController,
              hint: 'Password',
              icon: Icons.lock,
              isPassword: true,
            ),
            const SizedBox(height: 24),
            TombolUtama(label: 'Login', onPressed: _login),
            const SizedBox(height: 24),
            KartuHasilLogin(
              username: _username,
              password: _password,
              pesan: _pesan,
              berhasil: _berhasil,
            ),
          ],
        ),
      ),
    );
  }
}
