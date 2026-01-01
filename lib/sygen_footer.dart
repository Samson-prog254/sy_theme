// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class SygenFooter extends StatelessWidget {
  const SygenFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Crafted with',
          style: TextStyle(
              fontFamily: 'amsterdam', fontSize: 40, color: Colors.white),
        ),
        const SizedBox(
          width: 5,
        ),
        Image.asset("assets/icons/love.png",
            color: Colors.white, width: 20, repeat: ImageRepeat.noRepeat),
        const SizedBox(
          width: 5,
        ),
        const Text(
          'Sygen',
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}