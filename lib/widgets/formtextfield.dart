import 'package:flutter/material.dart';

class FormTextField extends StatefulWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final String labelText;
  final String hintText;

  const FormTextField({
    Key? key,
    required this.controller,
    required this.validator,
    required this.keyboardType,
    required this.labelText,
    required this.hintText,
  }) : super(key: key);

  @override
  _FormTextFieldState createState() => _FormTextFieldState();
}

class _FormTextFieldState extends State<FormTextField> {
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
            decoration: InputDecoration(
              hintText: widget.hintText,
              border: OutlineInputBorder(),
              labelText: widget.labelText,
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
