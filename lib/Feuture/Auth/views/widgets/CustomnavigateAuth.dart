import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomnavigateAuth extends StatelessWidget {
  CustomnavigateAuth(
      {super.key,
      required this.device,
      required this.text,
      required this.screen,
      required this.onTap});
  void Function()? onTap;
  final Size device;
  final String text;
  final String screen;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: device.width * 0.2,
        ),
        Text(text),
        const SizedBox(
          width: 7,
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            screen,
            style: const TextStyle(
                fontSize: 18, color: Colors.blue, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
