import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:store_app/Feuture/views/Cart/widgets/totalPricecart.dart';
import 'package:store_app/Feuture/views/Home/views/home_screen.dart';
import 'package:store_app/Feuture/views/Item_Info/views/Item_Info_Screen.dart';
import 'CartItemListview.dart';

class CartScreenBody extends StatelessWidget {
  const CartScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    var device = MediaQuery.of(context).size;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      Get.to(ItemInfoScreen());
                    },
                    icon: const Icon(Icons.arrow_back_ios)),
                const Text(
                  "Shopping Bog",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                IconButton(
                    onPressed: () {
                      Get.to(HomeScreen());
                    },
                    icon: const FaIcon(
                      FontAwesomeIcons.cartShopping,
                      color: Colors.black,
                    ))
              ],
            ),
            SizedBox(
              height: device.height * 0.03,
            ),
            SizedBox(
              width: device.width,
              height: device.height * 0.65,
              child: Column(
                children: [
                  Expanded(
                    child: CartItemListview(
                        device: device, image: "assets/OIP.jpeg"),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: device.height * 0.01,
            ),
            totalPricecart(device: device),
            SizedBox(
              height: device.height * 0.068,
            ),
            GestureDetector(
              child: Container(
                width: device.width * 0.9,
                height: device.height * 0.075,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(30)),
                child: const Center(
                    child: Text(
                  "Proceed To CheckOut",
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                )),
              ),
            )
          ],
        ),
      ),
    );
  }
}

