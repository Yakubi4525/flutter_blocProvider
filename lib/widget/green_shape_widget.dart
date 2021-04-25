import 'package:flutter/material.dart';
import 'package:rick_and_morty_bloc_provider/styles/theme.dart';

Widget greenshapeWidget({String status, String species, TextStyle textStyle}) {
  return Row(
    children: [
      Container(
        width: 10.0,
        height: 10.0,
        decoration: BoxDecoration(
          color: kIconGreenColor,
          borderRadius: BorderRadius.circular(50),
          border: Border.all(
            color: Colors.white,
            width: 1.0,
          ),
        ),
      ),
      SizedBox(
        width: 6,
      ),
      Text(
        '$status - $species',
        overflow: TextOverflow.ellipsis,
        style: textStyle,
      ),
    ],
  );
}
