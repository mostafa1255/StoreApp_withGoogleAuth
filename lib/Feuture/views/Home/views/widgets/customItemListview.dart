import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:store_app/Feuture/Product_Cubit/product_cubit.dart';
import 'package:store_app/Feuture/views/Item_Info/views/Item_Info_Screen.dart';

class customItemListview extends StatelessWidget {
  customItemListview({
    super.key,
    required this.deviceH,
    required this.deviceW,
    required this.device,
    required this.enfo,
  });

  final double deviceH;
  final double deviceW;
  final Size device;
  final bool enfo;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        if (state is ProductSucsess) {
          return Row(
            children: [
              Expanded(
                child: SizedBox(
                  width: deviceW,
                  height: deviceH * 1.23,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.Products.length,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: deviceW * 0.05,
                            vertical: deviceH * 0.05),
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Get.to(ItemInfoScreen(
                                  index: index,
                                ));
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: SizedBox(
                                  width: deviceW,
                                  height: deviceH,
                                  child: Image.network(
                                    state.Products[index].image,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: device.height * 0.01,
                            ),
                            enfo == true
                                ? Row(
                                    children: [
                                      Text(
                                        state.Products[index].id.toString(),
                                        overflow: TextOverflow.fade,
                                        style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        width: device.width * 0.2,
                                      ),
                                      Text(
                                        "\$${state.Products[index].price.toDouble()}",
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey,
                                            fontSize: 16),
                                      )
                                    ],
                                  )
                                : const SizedBox(
                                    height: 0,
                                  ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          );
        } else if (state is ProductFaliure) {
          return const Center(
            child: Text("There is No data Now"),
          );
        } else {
          return const Center(
            child: Text("Mostafaaaaaa"),
          );
        }
      },
    );
  }
}
