import 'package:flutter/material.dart';

class totalPricecart extends StatelessWidget {
  const totalPricecart({
    super.key,
    required this.device,
  });

  final Size device;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text("Bag Total",
            style:
                TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        Row(
          children: [
            const Text(
              "\$45",
              style:
                  TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: device.width * 0.01,
            ),
            const Text(
              "USD",
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.grey),
            )
          ],
        )
      ],
    );
  }
}
