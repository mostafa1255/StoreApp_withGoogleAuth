import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:store_app/Feuture/Cart_Product_Cubit/cart_product_cubit.dart';
import 'package:store_app/Feuture/Product_Cubit/product_cubit.dart';
import 'package:store_app/Feuture/views/Cart/cart_screen.dart';
import 'package:store_app/core/constant.dart';
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
            padding: EdgeInsets.symmetric(
                horizontal: device.width * 0.04,
                vertical: device.height * 0.025),
            child: Column(
              children: [
                SizedBox(
                  child: customitemrowinfo(
                    device: device,
                    info: state.Products[index].title.toString(),
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: device.height * 0.006,
                ),
                customitemrowinfo(
                    device: device,
                    info: "\$${state.Products[index].price}",
                    color: Colors.yellow),
                const SizedBox(
                  height: 0,
                ),
                customitemrowinfo(
                  device: device,
                  info:
                      "Number of Item are Avaliable : ${state.Products[index].rating.count}",
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
                        SizedBox(
                          height: device.height * 0.05,
                        )
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
                  onTap: () async {
                    BlocProvider.of<ProductCubit>(context)
                        .setPrice(Price: state.Products[index].price);
                    BlocProvider.of<ProductCubit>(context).CountItemCart();
                    Get.to(CartScreen(
                      countitem: BlocProvider.of<ProductCubit>(context)
                          .GetCountItemCart(),
                      index: index,
                    ));
                    await BlocProvider.of<CartProductCubit>(context)
                        .sendCartProduct(
                            image: state.Products[index].image.toString(),
                            title: state.Products[index].title.toString(),
                            price: state.Products[index].price.toString(),
                            userid: constant.userid == null
                                ? "null"
                                : constant.userid.toString());
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
