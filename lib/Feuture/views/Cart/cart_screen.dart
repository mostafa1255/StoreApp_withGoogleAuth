import 'package:flutter/material.dart';
import 'package:store_app/Feuture/views/Cart/widgets/CartScreenBody.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key, required this.index, required this.countitem});
  final int index;
   final int countitem;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CartScreenBody(index: index,countitem: countitem),
    );
  }
}
