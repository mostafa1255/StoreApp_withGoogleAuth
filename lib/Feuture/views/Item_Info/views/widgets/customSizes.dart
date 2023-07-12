import 'package:flutter/material.dart';

class customSizes extends StatelessWidget {
  const customSizes({
    super.key,
    required this.device,
    required this.size,
  });

  final Size device;
  final String size;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: device.width * 0.07,
      height: device.height * 0.032,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: Colors.grey.withOpacity(0.19),
            spreadRadius: 2,
            offset: const Offset(2, 2))
      ], color: Colors.white, borderRadius: BorderRadius.circular(5)),
      child: Center(child: Text(size)),
    );
  }
}
