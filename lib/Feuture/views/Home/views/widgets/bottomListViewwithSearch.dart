import 'package:flutter/material.dart';

import 'customItemListview.dart';

class bottomListViewwithSearch extends StatelessWidget {
  const bottomListViewwithSearch({
    super.key,
    required this.device,
  });

  final Size device;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        customItemListview(
            Price: 12,
            image: "",
            title: "test",
            deviceH: device.height * 0.25,
            deviceW: device.width * 0.37,
            device: device,
            enfo: false),
        Positioned(
          bottom: 16,
          right: (device.width - device.width * 0.155) / 2,
          child: Container(
            height: device.height * 0.068,
            width: device.width * 0.22,
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0, 2),
                  blurRadius: 9.0,
                ),
              ],
              borderRadius: BorderRadius.circular(25),
              color: const Color(0xff343434),
            ),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                size: 34,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
