import 'package:flutter/material.dart';

Widget avatarWidget({String url, double radius, int heroIndex}) {
  return Hero(
      tag: heroIndex,
      child: Container(
      child: CircleAvatar(
      radius: radius,
      backgroundImage: NetworkImage(url),
    )),
  );
}
