import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:store_app/Feuture/views/Cart/data/Cart_Model.dart';
import 'package:store_app/core/constant.dart';
part 'cart_product_state.dart';

class CartProductCubit extends Cubit<CartProductState> {
  CartProductCubit() : super(CartProductInitial());

  cartModel? cartmodel;

  Future<void> sendCartProduct(
      {required String image,
      required String title,
      required String price,
      required String userid}) async {
    cartModel cartmodel =
        cartModel(image: image, title: title, price: price, userid: userid);
    try {
      await FirebaseFirestore.instance
          .collection('cart')
          .doc(userid)
          .set(cartmodel.tojson());
      print("Send Sucsess");
      emit(CartProductSendSucsess());
    } on FirebaseException catch (e) {
      print("Send Faliure");
      emit(CartProductSendFaliure(errmessage: e.message.toString()));
    } on Exception catch (e) {
      print("Send Faliure");
      emit(CartProductSendFaliure(errmessage: e.toString()));
    }
  }

  void getCartProduct() async {
    try {
      final userDoc = await FirebaseFirestore.instance
          .collection("cart")
          .doc(constant.userid)
          .get();
      final userdata = userDoc.data()!;
      cartmodel = cartModel.fromjson(data: userdata);
      print("Get data sucsess");
      emit(CartProductGetSucsess());
    } on FirebaseException catch (e) {
      print("Get data faliure");
      emit(CartProductGetFaliure(errmessage: e.message.toString()));
    }
  }
}
