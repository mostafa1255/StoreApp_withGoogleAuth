import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:store_app/Feuture/views/Cart/data/Cart_Model.dart';
part 'cart_product_state.dart';

class CartProductCubit extends Cubit<CartProductState> {
  CartProductCubit() : super(CartProductInitial());
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
}
