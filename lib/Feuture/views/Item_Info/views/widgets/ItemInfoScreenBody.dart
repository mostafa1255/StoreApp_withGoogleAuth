import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:store_app/Feuture/Product_Cubit/product_cubit.dart';
import 'package:store_app/Feuture/views/Cart/cart_screen.dart';
import '../../../Home/views/home_screen.dart';
import 'customItemInfo.dart';

class ItemInfoScreenBody extends StatelessWidget {
  const ItemInfoScreenBody({
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
          return Stack(
            children: [
              Image.network(
                state.Products[index].image.toString(),
                width: device.width,
                height: device.height,
                fit: BoxFit.cover,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: device.width * 0.02,
                        vertical: device.height * 0.04),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () {
                              Get.to(const HomeScreen());
                            },
                            icon: const Icon(Icons.arrow_back_ios)),
                        IconButton(
                            onPressed: () {
                              Get.to(CartScreen(
                                countitem:
                                    BlocProvider.of<ProductCubit>(context)
                                        .GetCountItemCart(),
                                index: index,
                              ));
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
                  ),
                  Container(
                    width: device.width,
                    height: device.height * 0.47,
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
                        customItemInfo(
                          device: device,
                          index: index,
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
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
