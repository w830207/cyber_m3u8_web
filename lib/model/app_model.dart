import 'package:flutter/material.dart';

class AppModel {
  String name;
  String image;
  String appleLink;
  String googleLink;
  String pubDevLink;
  Color backgroundColor;
  String head;
  String content;
  Widget app;

  AppModel({
    required this.name,
    this.image = '',
    this.appleLink = '',
    this.googleLink = '',
    this.pubDevLink = '',
    this.backgroundColor = Colors.white,
    this.head = 'images/head0.webp',
    this.content = '',
    this.app = const SizedBox(),
  });
}
