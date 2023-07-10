import 'package:flutter/material.dart';

class customItemListview extends StatelessWidget {
  const customItemListview({
    super.key,
    required this.deviceH,
    required this.deviceW,
  });

  final double deviceH;
  final double deviceW;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            width: deviceW,
            height: deviceH,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 2,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
                  child: Container(
                    width: deviceW,
                    height: deviceH,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(20)),
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
