import 'package:flutter/material.dart';

class customItemListview extends StatelessWidget {
  const customItemListview({
    super.key,
    required this.deviceH,
    required this.deviceW,
    required this.device,
    required this.enfo,
  });

  final double deviceH;
  final double deviceW;
  final Size device;
  final bool enfo;
  @override
  Widget build(BuildContext context) {
    return Row(
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                  child: Column(
                    children: [
                      Container(
                        width: deviceW,
                        height: deviceH,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      SizedBox(
                        height: device.height * 0.02,
                      ),
                      enfo == true
                          ? Row(
                              children: [
                                Text(
                                  "Winter Coat",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: device.width * 0.2,
                                ),
                                Text(
                                  "\$80",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey,
                                      fontSize: 16),
                                )
                              ],
                            )
                          : SizedBox(
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
    );
  }
}
