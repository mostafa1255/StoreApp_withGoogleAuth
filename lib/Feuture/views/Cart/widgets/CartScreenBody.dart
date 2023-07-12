import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:store_app/Feuture/views/Home/views/home_screen.dart';
import 'package:store_app/Feuture/views/Item_Info/views/Item_Info_Screen.dart';

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
                    child: ListView.builder(
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
                                    'assets/OIP.jpeg',
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
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: device.height * 0.04,
                                  ),
                                  const Text(
                                    "\$19.98",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: device.height * 0.01,
            ),
            Row(
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
            ),
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
