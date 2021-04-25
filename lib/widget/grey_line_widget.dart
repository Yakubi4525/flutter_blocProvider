import 'package:flutter/material.dart';

Widget greyLineWidget() {
  return Container(
    width: double.infinity,
      decoration: BoxDecoration(
          border: Border(
              top:
                  BorderSide(color: Colors.white.withOpacity(0.2), width: 1))));
}
