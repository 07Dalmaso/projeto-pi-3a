import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final String labelText;
  final String hintText;

  const PasswordField({
    Key? key,
    required this.controller,
    required this.validator,
    required this.keyboardType,
    required this.labelText,
    required this.hintText,
  }) : super(key: key);

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.white,
        ),
        child: Align(
          alignment: Alignment.centerLeft,
          child: TextFormField(
            controller: widget.controller,
            validator: widget.validator,
            keyboardType: widget.keyboardType,
            obscureText: !_isPasswordVisible, // Toggle password visibility
            decoration: InputDecoration(
              hintText: widget.hintText,
              border: OutlineInputBorder(),
              labelText: widget.labelText,
              suffixIcon: IconButton(
                color: Colors.grey,
                icon: Icon(
                  _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    _isPasswordVisible = !_isPasswordVisible;
                  });
                },
              ),
            ),
            onChanged: (text) {
              setState(() {});
            },
          ),
        ),
      ),
    );
  }
}
