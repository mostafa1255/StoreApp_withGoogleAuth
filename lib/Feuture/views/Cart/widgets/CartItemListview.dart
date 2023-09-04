import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:store_app/Feuture/Cart_Product_Cubit/cart_product_cubit.dart';
import 'package:store_app/Feuture/Product_Cubit/product_cubit.dart';
import 'package:store_app/Feuture/views/Item_Info/views/Item_Info_Screen.dart';

class CartItemListview extends StatelessWidget {
  const CartItemListview({
    super.key,
    required this.device,
    required this.indexs,
    required this.countitem,
  });
  final int indexs;
  final Size device;
  final int countitem;
  @override
  Widget build(BuildContext context) {
    var cartCubit= BlocProvider.of<CartProductCubit>(context);
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        if (state is ProductSucsess) {
          return ListView.builder(
            itemCount: countitem,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(bottom: device.height * 0.01),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.to(ItemInfoScreen(index: indexs));
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(25.0),
                        child: SizedBox(
                          width: device.width * 0.25,
                          height: device.height * 0.12,
                          child: Image.network(
                            state.Products[indexs].image.toString(),
                            fit: BoxFit.cover,
                          ),
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
                          height: device.height * 0.002,
                        ),
                        SizedBox(
                          width: device.width * 0.5,
                          height: device.height * 0.1,
                          child: Text(
                            state.Products[indexs].title.toString(),
                            overflow: TextOverflow.fade,
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: device.height * 0.002,
                        ),
                        Text(
                          "\$${state.Products[indexs].price}",
                          style: const TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        )
                      ],
                    )
                  ],
                ),
              );
            },
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
