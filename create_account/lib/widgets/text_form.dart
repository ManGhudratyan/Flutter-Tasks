import 'package:flutter/material.dart';

class TextForm extends StatefulWidget {
  const TextForm(
      {this.hintText,
      this.validator,
      this.onChanged,
      this.obscureText = false,
      this.controller,
      super.key});

  final String? Function(String?)? validator;
  final String? hintText;
  final void Function(String)? onChanged;
  final bool obscureText;
  final TextEditingController? controller;

  @override
  State<TextForm> createState() => _TextFormState();
}

class _TextFormState extends State<TextForm> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: _globalKey,
      validator: widget.validator,
      onChanged: (value) {
        widget.onChanged?.call(value);
      },
      obscureText: widget.obscureText,
      decoration: InputDecoration(
        hintText: widget.hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        filled: true,
        fillColor: const Color.fromRGBO(247, 247, 247, 1),
      ),
    );
  }
}
