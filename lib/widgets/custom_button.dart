import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

customButton(
  Function()? ontap,
) {
  return Material(
    child: InkWell(
      onTap: ontap,
      child: Container(
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.lightGreen,
        ),
        alignment: Alignment.center,
        height: 66,
        width: double.maxFinite,
        child: Text('Calcular'),
      ),
    ),
  );
}
