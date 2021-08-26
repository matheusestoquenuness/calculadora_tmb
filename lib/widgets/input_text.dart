import 'package:flutter/material.dart';

customInput(
  TextEditingController controller,
  String label,
) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextField(
      controller: controller,
      decoration: InputDecoration(labelText: label),
      keyboardType: TextInputType.number,
    ),
  );
}
