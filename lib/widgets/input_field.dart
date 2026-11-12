import 'package:flutter/material.dart';

/// Kolom input yang dipakai ulang (username, password, ganti nama).
///
/// Berupa StatefulWidget karena ikon mata pada kolom password
/// membutuhkan state sendiri (_obscureText) yang berubah saat ikon ditekan.
class InputField extends StatefulWidget {
  const InputField({
    super.key,
    required this.controller,
    required this.hint,
    required this.icon,
    this.isPassword = false,
  });

  final TextEditingController controller;
  final String hint;
  final IconData icon;
  final bool isPassword;

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  // True = teks disembunyikan. Hanya relevan jika isPassword == true.
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword;
  }

  void _toggleVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: _obscureText,
      decoration: InputDecoration(
        hintText: widget.hint,
        prefixIcon: Icon(widget.icon),
        // Ikon mata hanya muncul pada kolom password.
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                ),
                onPressed: _toggleVisibility,
              )
            : null,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
