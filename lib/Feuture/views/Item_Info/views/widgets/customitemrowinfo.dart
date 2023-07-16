import 'package:flutter/material.dart';

class customitemrowinfo extends StatelessWidget {
  const customitemrowinfo({
    super.key,
    required this.device,
    required this.info,
    required this.color,
  });
  final Color color;
  final Size device;
  final String info;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: device.width * 0.8,
          height: device.height * 0.07,
          child: Text(
            info,
            overflow: TextOverflow.clip,
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24),
          ),
        ),
        Container(
          width: device.width * 0.06,
          height: device.height * 0.03,
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(20)),
        )
      ],
    );
  }
}
