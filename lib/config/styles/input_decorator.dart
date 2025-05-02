import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:vilcom_digital_restaurant/custom_widgets/custom_text.dart';

class InputDecorationX extends InputDecoration {
  // const InputDecorationX();

  static InputDecoration decorator({
    required String label,
    String? hint,
    Widget? suffixIcon,
    IconData? icon,
  }) {
    return InputDecoration(
      filled: true,
      fillColor: Color.fromARGB(255, 172, 132, 106),
      hintText: hint,
      prefixIcon: icon != null ? HugeIcon(
        icon: icon,
        color: Color(0xff8E6E53),
      ) : null,
      suffixIcon: suffixIcon,
      label: Padding(
        padding: const EdgeInsets.all(12.0),
        child: CText(text: label),
      ),
      floatingLabelStyle: TextStyle(fontSize: 25, color: Colors.black),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Color.fromARGB(255, 121, 77, 12)),
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide(color: Color.fromARGB(255, 172, 132, 106)),
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Color.fromARGB(255, 172, 132, 106)),
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
    );
  }
}
