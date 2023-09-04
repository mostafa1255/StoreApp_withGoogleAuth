import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:store_app/Feuture/Product_Cubit/product_cubit.dart';
import 'package:store_app/Feuture/views/Cart/widgets/totalPricecart.dart';
import 'package:store_app/Feuture/views/Home/views/home_screen.dart';
import 'package:store_app/Feuture/views/Item_Info/views/Item_Info_Screen.dart';
import 'CartItemListview.dart';

class CartScreenBody extends StatelessWidget {
  const CartScreenBody(
      {super.key, required this.index, required this.countitem});
  final int index;
  final int countitem;
  @override
  Widget build(BuildContext context) {
    var device = MediaQuery.of(context).size;
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        if (state is ProductSucsess) {
          return SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: device.width * 0.04),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {
                            Get.to(ItemInfoScreen(
                              index: index,
                            ));
                          },
                          icon: const Icon(Icons.arrow_back_ios)),
                      const Text(
                        "Shopping Bog",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                          onPressed: () {
                            Get.to(const HomeScreen());
                          },
                          icon: FaIcon(
                            FontAwesomeIcons.cartShopping,
                            color: BlocProvider.of<ProductCubit>(context)
                                        .GetCountItemCart() ==
                                    0
                                ? Colors.black
                                : Colors.green,
                          ))
                    ],
                  ),
                  SizedBox(
                    height: device.height * 0.03,
                  ),
                  SizedBox(
                    width: device.width,
                    height: device.height * 0.62,
                    child: Column(
                      children: [
                        Expanded(
    /*catItem*/                       child: CartItemListview(
                            countitem: countitem,
                            device: device,
                            indexs: index,
                          ),
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
        } else if (state is ProductFaliure) {
          return const Center(
            child: Text("There is no Data"),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
