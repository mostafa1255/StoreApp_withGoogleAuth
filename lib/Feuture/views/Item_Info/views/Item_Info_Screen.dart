import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:store_app/Feuture/views/Home/views/home_screen.dart';

class ItemInfoScreen extends StatelessWidget {
  const ItemInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var device = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Stack(
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 30),
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
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 22),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Winter Coat",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 24),
                              ),
                              Container(
                                width: device.width * 0.06,
                                height: device.height * 0.03,
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(20)),
                              )
                            ],
                          ),
                          SizedBox(
                            height: device.height * 0.013,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "\$80",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24),
                              ),
                              Container(
                                width: device.width * 0.06,
                                height: device.height * 0.03,
                                decoration: BoxDecoration(
                                    color: Colors.yellow,
                                    borderRadius: BorderRadius.circular(20)),
                              )
                            ],
                          ),
                          SizedBox(
                            height: device.height * 0.02,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Your Size",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              Container(
                                width: device.width * 0.06,
                                height: device.height * 0.03,
                                decoration: BoxDecoration(
                                    color: Colors.purpleAccent[100],
                                    borderRadius: BorderRadius.circular(20)),
                              )
                            ],
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
                                  Container(
                                    width: device.width * 0.07,
                                    height: device.height * 0.032,
                                    decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.19),
                                              spreadRadius: 2,
                                              offset: Offset(2, 2))
                                        ],
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(5)),
                                    child: const Center(child: Text("S")),
                                  ),
                                  SizedBox(
                                    width: device.width * 0.04,
                                  ),
                                  Container(
                                    width: device.width * 0.07,
                                    height: device.height * 0.032,
                                    decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.19),
                                              spreadRadius: 2,
                                              offset: Offset(2, 2))
                                        ],
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(5)),
                                    child: const Center(child: Text("M")),
                                  ),
                                  SizedBox(
                                    width: device.width * 0.04,
                                  ),
                                  Container(
                                    width: device.width * 0.07,
                                    height: device.height * 0.032,
                                    decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.19),
                                              spreadRadius: 2,
                                              offset: Offset(2, 2))
                                        ],
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(5)),
                                    child: const Center(child: Text("L")),
                                  ),
                                  SizedBox(
                                    width: device.width * 0.04,
                                  ),
                                  Container(
                                    width: device.width * 0.07,
                                    height: device.height * 0.032,
                                    decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.19),
                                              spreadRadius: 2,
                                              offset: Offset(2, 2))
                                        ],
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(5)),
                                    child: const Center(child: Text("XL")),
                                  )
                                ],
                              ),
                              Container(
                                width: device.width * 0.06,
                                height: device.height * 0.03,
                                decoration: BoxDecoration(
                                    color: Colors.black,
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
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
