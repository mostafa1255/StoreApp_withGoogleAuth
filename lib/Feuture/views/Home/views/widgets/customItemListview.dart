import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/Feuture/views/Item_Info/views/Item_Info_Screen.dart';

class customItemListview extends StatelessWidget {
  const customItemListview({
    super.key,
    required this.deviceH,
    required this.deviceW,
    required this.device,
    required this.enfo,
    required this.image,
    required this.Price,
    required this.title,
  });
  final double Price;
  final String image;
  final String title;
  final double deviceH;
  final double deviceW;
  final Size device;
  final bool enfo;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(ItemInfoScreen()),
      child: Row(
        children: [
          Expanded(
            child: SizedBox(
              width: deviceW,
              height: deviceH * 1.24,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 16),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: SizedBox(
                            width: deviceW,
                            height: deviceH,
                            child: Image.asset(
                              image,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: device.height * 0.02,
                        ),
                        enfo == true
                            ? Row(
                                children: [
                                  Text(
                                    title,
                                    style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width: device.width * 0.2,
                                  ),
                                  Text(
                                    "\$$Price",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey,
                                        fontSize: 16),
                                  )
                                ],
                              )
                            : const SizedBox(
                                height: 0,
                              ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
