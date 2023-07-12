import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../Home/views/home_screen.dart';
import 'customItemInfo.dart';

class ItemInfoScreenBody extends StatelessWidget {
  const ItemInfoScreenBody({
    super.key,
    required this.device,
  });

  final Size device;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/Screenshot 2023-07-11 183723.png",
          width: device.width,
          height: device.height,
          fit: BoxFit.cover,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        Get.to(const HomeScreen());
                      },
                      icon: const Icon(Icons.arrow_back_ios)),
                  IconButton(
                      onPressed: () {},
                      icon: const FaIcon(
                        FontAwesomeIcons.cartShopping,
                        color: Colors.black,
                      )),
                ],
              ),
            ),
            Container(
              width: device.width,
              height: device.height * 0.38,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: device.height * 0.01,
                  ),
                  Container(
                    width: device.width * 0.18,
                    height: device.height * 0.006,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(25)),
                  ),
                  customItemInfo(device: device)
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}
