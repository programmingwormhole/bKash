import 'package:flutter/material.dart';

PreferredSizeWidget customPageBar(String title) {
  return AppBar(
    backgroundColor: Colors.pink,
    // leading: Icon(Icons.arrow_back),
    title: Text(title, style: TextStyle(
      fontWeight: FontWeight.w400
    ),),
    centerTitle: true,
    elevation: 1,
    actions: [
      Image.asset(
        'assets/images/bKash_logo.png',
        color: Colors.white,
        height: 35,
        width: 35,),
      SizedBox(
        width: 15,
      )
    ],
  );
}