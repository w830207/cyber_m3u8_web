import 'package:flutter/material.dart';

class AppModel {
  String name;
  String image;
  String appleLink;
  String googleLink;
  Color backgroundColor;
  String head;
  String content;

  AppModel({
    required this.name,
    required this.image,
    this.appleLink = '',
    this.googleLink = '',
    this.backgroundColor = Colors.white,
    this.head = 'images/head0.png',
    this.content = '',
  });
}
