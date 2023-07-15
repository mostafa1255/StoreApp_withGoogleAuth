import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:store_app/Feuture/Product_Cubit/product_cubit.dart';
import 'package:store_app/Feuture/views/Cart/cart_screen.dart';

import 'customSizes.dart';
import 'customitemrowinfo.dart';

class customItemInfo extends StatelessWidget {
  const customItemInfo({
    super.key,
    required this.device,
    required this.index,
  });

  final Size device;
  final int index;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        if (state is ProductSucsess) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 22),
            child: Column(
              children: [
                customitemrowinfo(
                  device: device,
                  info: state.Products[index].title.toString(),
                  color: Colors.black,
                ),
                SizedBox(
                  height: device.height * 0.013,
                ),
                customitemrowinfo(
                    device: device,
                    info: "\$${state.Products[index].price}",
                    color: Colors.yellow),
                SizedBox(
                  height: device.height * 0.02,
                ),
                customitemrowinfo(
                  device: device,
                  info: "Your Size",
                  color: Colors.purpleAccent,
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
                        customSizes(device: device, size: "S"),
                        SizedBox(
                          width: device.width * 0.04,
                        ),
                        customSizes(device: device, size: "M"),
                        SizedBox(
                          width: device.width * 0.04,
                        ),
                        customSizes(device: device, size: "L"),
                        SizedBox(
                          width: device.width * 0.04,
                        ),
                        customSizes(device: device, size: "XL"),
                      ],
                    ),
                    Container(
                      width: device.width * 0.06,
                      height: device.height * 0.03,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(20)),
                    )
                  ],
                ),
                SizedBox(
                  height: device.height * 0.03,
                ),
                GestureDetector(
                  onTap: () {
                    BlocProvider.of<ProductCubit>(context)
                        .setPrice(Price: state.Products[index].price);
                    BlocProvider.of<ProductCubit>(context).CountItemCart();
                    Get.to(CartScreen(
                      countitem: BlocProvider.of<ProductCubit>(context)
                          .GetCountItemCart(),
                      index: index,
                    ));
                  },
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
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    )),
                  ),
                )
              ],
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
