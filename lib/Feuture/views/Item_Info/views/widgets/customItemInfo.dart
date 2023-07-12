import 'package:flutter/material.dart';

import 'customSizes.dart';
import 'customitemrowinfo.dart';

class customItemInfo extends StatelessWidget {
  const customItemInfo({
    super.key,
    required this.device,
  });

  final Size device;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 22),
      child: Column(
        children: [
          customitemrowinfo(
            device: device,
            info: "Winter Coat",
            color: Colors.black,
          ),
          SizedBox(
            height: device.height * 0.013,
          ),
          customitemrowinfo(device: device, info: "\$80", color: Colors.yellow),
          SizedBox(
            height: device.height * 0.02,
          ),
          customitemrowinfo(
            device: device,
            info: "Your Size",
            color: Colors.purpleAccent,
          ),
          SizedBox(
            height: device.height * 0.02,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: device.width * 0.02,
                  ),
                  customSizes(device: device, size: "S"),
                  SizedBox(
                    width: device.width * 0.04,
                  ),
                  customSizes(device: device, size: "M"),
                  SizedBox(
                    width: device.width * 0.04,
                  ),
                  customSizes(device: device, size: "L"),
                  SizedBox(
                    width: device.width * 0.04,
                  ),
                  customSizes(device: device, size: "XL"),
                ],
              ),
              Container(
                width: device.width * 0.06,
                height: device.height * 0.03,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(20)),
              )
            ],
          ),
          SizedBox(
            height: device.height * 0.03,
          ),
          GestureDetector(
            child: Container(
              width: device.width * 0.9,
              height: device.height * 0.065,
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(30)),
              child: const Center(
                  child: Text(
                "Add to Cart",
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              )),
            ),
          )
        ],
      ),
    );
  }
}

