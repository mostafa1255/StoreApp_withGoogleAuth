import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:store_app/Feuture/Product_Cubit/product_cubit.dart';
import 'package:store_app/Feuture/views/Cart/cart_screen.dart';
import 'package:store_app/Feuture/views/Home/views/widgets/HomeScreenbody.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Get.to(CartScreen(
                  countitem:
                      BlocProvider.of<ProductCubit>(context).GetCountItemCart(),
                  index: 0,
                ));
              },
              icon: const FaIcon(
                FontAwesomeIcons.cartShopping,
                color: Colors.black,
              ))
        ],
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Builder(
          builder: (context) => InkWell(
            onTap: () {
              Scaffold.of(context).openDrawer();
            },
            child: const Icon(
              Icons.menu,
              color: Colors.black,
              size: 30.0,
            ),
          ),
        ),
      ),
      drawer: const Drawer(
          backgroundColor: Colors.white24,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              UserAccountsDrawerHeader(
                  accountName: Text("Mostafa"),
                  accountEmail: Text("Mostafa@gmail.com"))
            ],
          )),
      body: HomeScreenbody(),
    );
  }
}
