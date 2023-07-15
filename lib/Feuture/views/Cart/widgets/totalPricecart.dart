import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Product_Cubit/product_cubit.dart';

class totalPricecart extends StatelessWidget {
  const totalPricecart({
    super.key,
    required this.device,
  });

  final Size device;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text("Bag Total",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        Row(
          children: [
            SizedBox(
              width: device.width * 0.5,
              height: device.height * 0.06,
              child: Text(
                "\$${BlocProvider.of<ProductCubit>(context).getPrice()}",
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              width: device.width * 0.01,
            ),
            const Text(
              "USD",
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
            )
          ],
        )
      ],
    );
  }
}
