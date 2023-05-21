import 'package:flutter/material.dart';

import 'package:mp_tictactoe/utils/colors.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool isReadOnly;
  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.isReadOnly = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: gradient2,
            blurRadius: 25,
            spreadRadius: -5.0,
          ),
        ],
      ),
      child: TextField(
        textAlign: TextAlign.center,
        readOnly: isReadOnly,
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
          fillColor: backgroundColor,
          filled: true,
          hintText: hintText,
        ),
      ),
    );
  }
}
