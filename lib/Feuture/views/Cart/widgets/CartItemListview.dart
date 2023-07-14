import 'package:flutter/material.dart';

class CartItemListview extends StatelessWidget {
  const CartItemListview({
    super.key,
    required this.device,
    required this.image,
  });

  final Size device;
  final String image;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 15,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(25.0),
                child: SizedBox(
                  width: device.width * 0.25,
                  height: device.height * 0.12,
                  child: Image.asset(
                    image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                width: device.width * 0.06,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: device.height * 0.01,
                  ),
                  const Text(
                    "Focial Cleanser",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: device.height * 0.04,
                  ),
                  const Text(
                    "\$19.98",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  )
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
