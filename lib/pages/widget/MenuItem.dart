import 'package:flutter/material.dart';

Widget menuItem(String menuIcon, String name) {
  return InkWell(
    onTap: () {

    },
    child: Column(
      children: [
        Image.asset(menuIcon,
          height: 50,
        ),
        Text(name),
        SizedBox(
          width: 20,
        )
      ],
    ),
  );
}
